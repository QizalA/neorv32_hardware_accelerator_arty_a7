-- ====================================================================
-- NEORV32 CFS - 4x4 int8 (signed) Systolic GEMM with 32-bit accumulators
-- Pipelined bus (STB->latch ADDR/DATA/RW, ACK next cycle)
-- Word 0 (read) = 0xCAFEBABE (ID)
-- CTL write at word 0: bit0=STEP (advance 1 systolic cycle), bit1=CLEAR
-- A rows at words 1..4 (row0..row3), B columns at words 5..8 (col0..col3)
-- C results at words 16..31 (row-major, 32b each)
-- Now with wavefront skew (row i, col j start at steps i and j)
-- ====================================================================
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library neorv32;
use neorv32.neorv32_package.all;

entity neorv32_cfs is
  port (
    -- global
    clk_i     : in  std_ulogic;
    rstn_i    : in  std_ulogic;
    -- CPU bus
    bus_req_i : in  bus_req_t;
    bus_rsp_o : out bus_rsp_t;
    -- IRQ & external IO (unused)
    irq_o     : out std_ulogic;
    cfs_in_i  : in  std_ulogic_vector(255 downto 0);
    cfs_out_o : out std_ulogic_vector(255 downto 0)
  );
end neorv32_cfs;

architecture rtl of neorv32_cfs is

  --------------------------------------------------------------------
  -- Handshake and pipelining
  --------------------------------------------------------------------
  signal stb_q   : std_ulogic := '0';                          -- delayed STB for ACK
  signal addr_q  : unsigned(6 downto 2) := (others => '0');    -- latched word address (addr[6:2])
  signal data_q  : std_ulogic_vector(31 downto 0) := (others => '0'); -- latched write data
  signal rw_q    : std_ulogic := '0';                          -- latched R/W: '1'=write, '0'=read

  signal wen_q   : std_ulogic;  -- asserted on ACK cycle when previous request was write
  signal ren_q   : std_ulogic;  -- asserted on ACK cycle when previous request was read

  --------------------------------------------------------------------
  -- Data path
  --------------------------------------------------------------------
  type vec32_t is array (0 to 3) of std_ulogic_vector(31 downto 0);

  -- Input staging: 4 words for A (one per row), 4 words for B (one per column)
  -- LSB [7:0] is the next byte to inject; words shift right by 8 each valid STEP-window.
  signal a_row : vec32_t := (others => (others => '0')); -- west-edge injection (rows 0..3)
  signal b_col : vec32_t := (others => (others => '0')); -- north-edge injection (cols 0..3)

  -- 4x4 PE accumulators (row-major)
  type acc_t is array (0 to 15) of signed(31 downto 0);
  signal acc : acc_t := (others => (others => '0'));

  -- 4x4 systolic byte pipelines flowing right/down (registered)
  type byte_vec_t is array (0 to 15) of std_ulogic_vector(7 downto 0);
  signal a_pipe : byte_vec_t := (others => (others => '0')); -- carries A bytes to the right
  signal b_pipe : byte_vec_t := (others => (others => '0')); -- carries B bytes downward

  -- Control pulses
  signal step_pulse  : std_ulogic := '0'; -- CTL bit0
  signal clear_pulse : std_ulogic := '0'; -- CTL bit1

  -- Wavefront skew step counter
  signal step_ctr : unsigned(3 downto 0) := (others => '0');

  --------------------------------------------------------------------
  -- Bus response
  --------------------------------------------------------------------
  signal rsp_ack  : std_ulogic := '0';
  signal rsp_err  : std_ulogic := '0';
  signal rsp_rdat : std_ulogic_vector(31 downto 0) := (others => '0');

  --------------------------------------------------------------------
  -- Helpers
  --------------------------------------------------------------------
  function s8(v : std_ulogic_vector(7 downto 0)) return signed is
  begin
    return signed(v); -- interpret 8-bit as signed
  end function;

  -- signed(31 downto 0) -> std_ulogic_vector(31 downto 0)
  function to_u32(v : signed(31 downto 0)) return std_ulogic_vector is
  begin
    return std_ulogic_vector(std_logic_vector(v));
  end function;

begin
  irq_o     <= '0';
  cfs_out_o <= (others => '0');

  --------------------------------------------------------------------
  -- Latch request on STB, ACK next cycle
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
  begin
    if rstn_i = '0' then
      stb_q   <= '0';
      rsp_ack <= '0';
      addr_q  <= (others => '0');
      data_q  <= (others => '0');
      rw_q    <= '0';
    elsif rising_edge(clk_i) then
      -- capture current request when presented
      if bus_req_i.stb = '1' then
        addr_q <= unsigned(bus_req_i.addr(6 downto 2)); -- word index inside CFS
        data_q <= bus_req_i.data;
        rw_q   <= bus_req_i.rw;
      end if;

      -- pipeline STB -> ACK
      stb_q   <= bus_req_i.stb;
      rsp_ack <= stb_q;
    end if;
  end process;

  -- enables valid on ACK cycle
  wen_q <= stb_q and rw_q;
  ren_q <= stb_q and (not rw_q);

  --------------------------------------------------------------------
  -- READBACK on ACK cycle using latched addr_q
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
  begin
    if rstn_i = '0' then
      rsp_rdat <= (others => '0');
    elsif rising_edge(clk_i) then
      rsp_rdat <= (others => '0');
      if ren_q = '1' then
        case to_integer(addr_q) is
          when  0 => rsp_rdat <= x"CAFEBABE"; -- ID signature
          when  1 => rsp_rdat <= a_row(0);
          when  2 => rsp_rdat <= a_row(1);
          when  3 => rsp_rdat <= a_row(2);
          when  4 => rsp_rdat <= a_row(3);
          when  5 => rsp_rdat <= b_col(0);
          when  6 => rsp_rdat <= b_col(1);
          when  7 => rsp_rdat <= b_col(2);
          when  8 => rsp_rdat <= b_col(3);
          -- C results (row-major)
          when 16 => rsp_rdat <= to_u32(acc( 0));
          when 17 => rsp_rdat <= to_u32(acc( 1));
          when 18 => rsp_rdat <= to_u32(acc( 2));
          when 19 => rsp_rdat <= to_u32(acc( 3));
          when 20 => rsp_rdat <= to_u32(acc( 4));
          when 21 => rsp_rdat <= to_u32(acc( 5));
          when 22 => rsp_rdat <= to_u32(acc( 6));
          when 23 => rsp_rdat <= to_u32(acc( 7));
          when 24 => rsp_rdat <= to_u32(acc( 8));
          when 25 => rsp_rdat <= to_u32(acc( 9));
          when 26 => rsp_rdat <= to_u32(acc(10));
          when 27 => rsp_rdat <= to_u32(acc(11));
          when 28 => rsp_rdat <= to_u32(acc(12));
          when 29 => rsp_rdat <= to_u32(acc(13));
          when 30 => rsp_rdat <= to_u32(acc(14));
          when 31 => rsp_rdat <= to_u32(acc(15));
          when others => null;
        end case;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- WRITE on ACK cycle: generate STEP/CLEAR pulses
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
  begin
    if rstn_i = '0' then
      step_pulse  <= '0';
      clear_pulse <= '0';
    elsif rising_edge(clk_i) then
      step_pulse  <= '0';
      clear_pulse <= '0';
      if wen_q = '1' then
        if to_integer(addr_q) = 0 then
          if data_q(0) = '1' then step_pulse  <= '1'; end if; -- STEP
          if data_q(1) = '1' then clear_pulse <= '1'; end if; -- CLEAR
        end if;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- STEP counter for wavefront skew (row i / col j start at steps i / j)
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
  begin
    if rstn_i = '0' then
      step_ctr <= (others => '0');
    elsif rising_edge(clk_i) then
      if clear_pulse = '1' then
        step_ctr <= (others => '0');
      elsif step_pulse = '1' then
        step_ctr <= step_ctr + 1;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- A/B staging registers with per-row/col gated shifting
  -- Shift each A row r only during steps [r .. r+3]; same for B col c.
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
  begin
    if rstn_i = '0' then
      a_row <= (others => (others => '0'));
      b_col <= (others => (others => '0'));
    elsif rising_edge(clk_i) then
      if clear_pulse = '1' then
        a_row <= (others => (others => '0'));
        b_col <= (others => (others => '0'));
      else
        -- 1) writes from bus (when addr 1..8)
        if wen_q = '1' then
          case to_integer(addr_q) is
            when 1 => a_row(0) <= data_q;
            when 2 => a_row(1) <= data_q;
            when 3 => a_row(2) <= data_q;
            when 4 => a_row(3) <= data_q;
            when 5 => b_col(0) <= data_q;
            when 6 => b_col(1) <= data_q;
            when 7 => b_col(2) <= data_q;
            when 8 => b_col(3) <= data_q;
            when others => null;
          end case;
        end if;

        -- 2) gated shift on STEP (consume one byte per active lane)
        if step_pulse = '1' then
          for r in 0 to 3 loop
            if (step_ctr >= to_unsigned(r, step_ctr'length)) and
               (step_ctr <  to_unsigned(r+4, step_ctr'length)) then
              a_row(r) <= x"00" & a_row(r)(31 downto 8);
            end if;
          end loop;
          for c in 0 to 3 loop
            if (step_ctr >= to_unsigned(c, step_ctr'length)) and
               (step_ctr <  to_unsigned(c+4, step_ctr'length)) then
              b_col(c) <= x"00" & b_col(c)(31 downto 8);
            end if;
          end loop;
        end if;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- 4x4 Systolic Array with skewed edge injection
  --------------------------------------------------------------------
  process(clk_i, rstn_i)
    variable next_a  : byte_vec_t;
    variable next_b  : byte_vec_t;
    variable a_byte  : std_ulogic_vector(7 downto 0);
    variable b_byte  : std_ulogic_vector(7 downto 0);
    variable idx     : integer;
  begin
    if rstn_i = '0' then
      acc    <= (others => (others => '0'));
      a_pipe <= (others => (others => '0'));
      b_pipe <= (others => (others => '0'));
    elsif rising_edge(clk_i) then
      if clear_pulse = '1' then
        acc    <= (others => (others => '0'));
        a_pipe <= (others => (others => '0'));
        b_pipe <= (others => (others => '0'));
      elsif step_pulse = '1' then
        next_a := a_pipe;
        next_b := b_pipe;

        -- update all 16 PEs in row-major order
        for i in 0 to 3 loop
          for j in 0 to 3 loop
            idx := i*4 + j;

            -- select A byte: inject from west for j=0 else from left neighbor
            if j = 0 then
              -- inject row i only when active window reached
              if step_ctr >= to_unsigned(i, step_ctr'length) then
                a_byte := a_row(i)(7 downto 0);
              else
                a_byte := (others => '0');
              end if;
            else
              a_byte := a_pipe(idx - 1);
            end if;

            -- select B byte: inject from north for i=0 else from top neighbor
            if i = 0 then
              -- inject col j only when active window reached
              if step_ctr >= to_unsigned(j, step_ctr'length) then
                b_byte := b_col(j)(7 downto 0);
              else
                b_byte := (others => '0');
              end if;
            else
              b_byte := b_pipe(idx - 4);
            end if;

            -- accumulate: int8 * int8 -> int32
            acc(idx) <= acc(idx) + resize(s8(a_byte) * s8(b_byte), 32);

            -- propagate to next stage (registered)
            next_a(idx) := a_byte;
            next_b(idx) := b_byte;
          end loop;
        end loop;

        -- commit pipes
        a_pipe <= next_a;
        b_pipe <= next_b;
      end if;
    end if;
  end process;

  --------------------------------------------------------------------
  -- Drive bus response
  --------------------------------------------------------------------
  bus_rsp_o.ack  <= rsp_ack;
  bus_rsp_o.err  <= '0';       -- permanently OK
  bus_rsp_o.data <= rsp_rdat;

end rtl;
