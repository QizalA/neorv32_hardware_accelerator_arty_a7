library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- ============================================================================
--  NEORV32 Custom Function Unit (CFU) - VHDL-93
--  Example ops (custom-0):
--    funct7=0000000, funct3=000 : 32x32 signed multiply (low 32b)
--    funct7=0000001, funct3=000 : DP4A (4x int8 signed dot product)
-- ============================================================================

entity neorv32_cpu_cp_cfu is
  port (
    -- clock & reset
    clk_i       : in  std_ulogic;
    rstn_i      : in  std_ulogic;

    -- ALU handshake
    start_i     : in  std_ulogic;  -- strobe when custom op enters EX
    active_i    : in  std_ulogic;  -- unused here (single-cycle), safe to keep

    -- CSR sideband (2-bit address as in your ALU)
    csr_we_i    : in  std_ulogic;
    csr_addr_i  : in  std_ulogic_vector(1 downto 0);
    csr_wdata_i : in  std_ulogic_vector(31 downto 0);
    csr_rdata_o : out std_ulogic_vector(31 downto 0);

    -- decode / operands
    rtype_i     : in  std_ulogic;                       -- unused here
    funct3_i    : in  std_ulogic_vector(2 downto 0);
    funct7_i    : in  std_ulogic_vector(6 downto 0);
    rs1_i       : in  std_ulogic_vector(31 downto 0);
    rs2_i       : in  std_ulogic_vector(31 downto 0);
    rs3_i       : in  std_ulogic_vector(31 downto 0);   -- unused here

    -- result & status
    result_o    : out std_ulogic_vector(31 downto 0);
    valid_o     : out std_ulogic
  );
end entity;

architecture rtl of neorv32_cpu_cp_cfu is

  -- small, optional CSRs (compile-time stubs)
  signal csr0_q, csr1_q : std_ulogic_vector(31 downto 0);

  -- datapath result
  signal res_q : std_ulogic_vector(31 downto 0);

  -- -------- DP4A helper (4x int8 signed dot product) --------
  function dp4a(rs1, rs2 : std_ulogic_vector(31 downto 0)) return signed is
    variable a0,a1,a2,a3 : signed(7 downto 0);
    variable b0,b1,b2,b3 : signed(7 downto 0);
    variable p0,p1,p2,p3 : signed(31 downto 0);
    variable sum         : signed(31 downto 0);
  begin
    a0 := signed(std_logic_vector(rs1( 7 downto  0)));
    a1 := signed(std_logic_vector(rs1(15 downto  8)));
    a2 := signed(std_logic_vector(rs1(23 downto 16)));
    a3 := signed(std_logic_vector(rs1(31 downto 24)));

    b0 := signed(std_logic_vector(rs2( 7 downto  0)));
    b1 := signed(std_logic_vector(rs2(15 downto  8)));
    b2 := signed(std_logic_vector(rs2(23 downto 16)));
    b3 := signed(std_logic_vector(rs2(31 downto 24)));

    -- widen partial products, then accumulate in 32 bits
    p0 := resize(resize(a0, 16) * resize(b0, 16), 32);
    p1 := resize(resize(a1, 16) * resize(b1, 16), 32);
    p2 := resize(resize(a2, 16) * resize(b2, 16), 32);
    p3 := resize(resize(a3, 16) * resize(b3, 16), 32);

    sum := p0 + p1 + p2 + p3;
    return sum;
  end function;

begin
  ------------------------------------------------------------------------------
  -- CSR stub (2 registers @ 00/01) - safe to ignore from software
  ------------------------------------------------------------------------------
  csr_proc: process(clk_i, rstn_i)
  begin
    if (rstn_i = '0') then
      csr0_q <= (others => '0');
      csr1_q <= (others => '0');
    elsif rising_edge(clk_i) then
      if (csr_we_i = '1') then
        case csr_addr_i is
          when "00"   => csr0_q <= csr_wdata_i;
          when "01"   => csr1_q <= csr_wdata_i;
          when others => null;
        end case;
      end if;
    end if;
  end process;

  csr_rdata_o <= csr0_q when (csr_addr_i = "00") else
                 csr1_q when (csr_addr_i = "01") else
                 (others => '0');

  ------------------------------------------------------------------------------
  -- Combinational datapath (single-cycle examples)
  ------------------------------------------------------------------------------
  comb_datapath: process(rs1_i, rs2_i, rs3_i, funct3_i, funct7_i, rtype_i, csr0_q, csr1_q)
    variable rs1_s : signed(31 downto 0);
    variable rs2_s : signed(31 downto 0);
    variable mul64 : signed(63 downto 0);
    variable res_s : signed(31 downto 0);
  begin
    rs1_s := signed(std_logic_vector(rs1_i));
    rs2_s := signed(std_logic_vector(rs2_i));
    res_s := (others => '0');

    -- custom-0 op decode
    if (funct3_i = "000") then
      if (funct7_i = "0000001") then
        -- DP4A
        res_s := dp4a(rs1_i, rs2_i);
      else
        -- 32×32 → 64, then take low 32 bits
        mul64 := rs1_s * rs2_s;  -- <<=== FIX: 32b * 32b returns 64b (no 128b width mismatch)
        res_s := signed(mul64(31 downto 0));
      end if;
    else
      res_s := (others => '0');
    end if;

    res_q <= std_ulogic_vector(std_logic_vector(res_s));
  end process;

  -- For single-cycle ops, assert valid when the op starts.
  result_o <= res_q;
  valid_o  <= start_i;

end architecture;
