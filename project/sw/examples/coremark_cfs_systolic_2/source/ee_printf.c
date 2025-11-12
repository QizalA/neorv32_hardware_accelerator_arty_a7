// Minimal UART-based ee_printf / printf for NEORV32 + CoreMark
// No stdio/newlib; avoids syscalls & keeps ROM tiny.
// Supports: %s %c %d %u %x %lu %lx %% and basic zero/width (e.g., %08x)

#include <stdarg.h>
#include <stdint.h>
#include "neorv32.h"   // UART0

static inline void put_ch(char c) { neorv32_uart0_putc((uint8_t)c); }

static void put_str(const char *s) {
  if (!s) s = "(null)";
  while (*s) put_ch(*s++);
}

static void put_u(unsigned long v, unsigned base, int width, int pad_zero) {
  char buf[32];
  int i = 0;
  if (base < 2) base = 10;
  do {
    unsigned d = (unsigned)(v % base);
    buf[i++] = (char)(d < 10 ? '0' + d : 'a' + (d - 10));
    v /= base;
  } while (v && i < (int)sizeof(buf));
  while (i < width && i < (int)sizeof(buf)) buf[i++] = pad_zero ? '0' : ' ';
  while (i--) put_ch(buf[i]);
}

static void put_s(long val, int width, int pad_zero) {
  unsigned long u = (val < 0) ? (unsigned long)(-val) : (unsigned long)val;
  if (val < 0) put_ch('-');
  put_u(u, 10, width, pad_zero);
}

static int vprint_uart(const char *fmt, va_list ap) {
  int cnt = 0;
  while (*fmt) {
    if (*fmt != '%') { put_ch(*fmt++); cnt++; continue; }
    fmt++;

    // parse minimal flags/width: '0' + [1..8] digits
    int pad_zero = 0, width = 0;
    if (*fmt == '0') { pad_zero = 1; fmt++; }
    while (*fmt >= '0' && *fmt <= '9') { width = width*10 + (*fmt - '0'); fmt++; }

    switch (*fmt) {
      case '%': put_ch('%'); cnt++; break;
      case 'c': { int c = va_arg(ap, int); put_ch((char)c); cnt++; } break;
      case 's': { const char *s = va_arg(ap, const char*); put_str(s); } break;
      case 'd': { int v = va_arg(ap, int); put_s((long)v, width, pad_zero); } break;
      case 'u': { unsigned v = va_arg(ap, unsigned); put_u(v, 10, width, pad_zero); } break;
      case 'x': { unsigned v = va_arg(ap, unsigned); put_u(v, 16, width, pad_zero); } break;
      case 'l': {  // handle %lu / %lx
        fmt++;
        unsigned long v = va_arg(ap, unsigned long);
        if (*fmt == 'u')       put_u(v, 10, width, pad_zero);
        else if (*fmt == 'x')  put_u(v, 16, width, pad_zero);
        else { /* fallback */  put_u(v, 10, width, pad_zero); fmt--; }
      } break;
      default:
        // print unknown spec literally to be safe
        put_ch('%'); put_ch(*fmt); break;
    }
    fmt++;
  }
  return cnt;
}

// Provide both ee_printf and printf so nothing drags in newlib's printf.
int ee_printf(const char *fmt, ...) {
  va_list ap; va_start(ap, fmt);
  int r = vprint_uart(fmt, ap);
  va_end(ap);
  return r;
}

int printf(const char *fmt, ...) {
  va_list ap; va_start(ap, fmt);
  int r = vprint_uart(fmt, ap);
  va_end(ap);
  return r;
}

// Optional: tiny puts to keep some libraries happy (no trailing newline added).
int puts(const char *s) { put_str(s); put_ch('\n'); return 0; }

