/**
 ******************************************************************************
 *
 *****************************************************************************/

#define F_CPU 16000000UL

/* Includes ------------------------------------------------------------------*/
#include "primes.h"
#include "STM8S103F3.h"
#include <string.h> // for memset

#define BREAK() __asm__("BREAK")

static char aIsPrime[990]; /* should be 1000; but the '103 only has 1024 bytes
                              of SRAM and there's not *quite* enough room for a
                              1000-byte array plus globals and stack, etc.
                            */
static unsigned int NumPrimes;

/*********************************************************************
 *
 *       _CalcPrimes()
 */
void _CalcPrimes(void) {
  unsigned int i;
  unsigned int j;

  //
  // Mark all as potential prime numbers
  //
  memset(aIsPrime, 1, sizeof(aIsPrime));
  //
  // 2 deserves a special treatment
  //
  for (i = 4; i < 1000; i += 2) {
    aIsPrime[i] = 0; // Cross it out: not a prime
  }
  //
  // Cross out multiples of every prime starting at 3. Crossing out starts at
  // i^2.
  //
  for (i = 3; i * i < sizeof(aIsPrime); i++) {
    if (aIsPrime[i]) {
      j = i * i; // The square of this prime is the first we need to cross out
      do {
        aIsPrime[j] = 0; // Cross it out: not a prime
        j += 2 * i;      // Skip even multiples (only 3*, 5*, 7* etc)
      } while (j < sizeof(aIsPrime));
    }
  }
  //
  // Count prime numbers
  //
  NumPrimes = 0;
  for (i = 2; i < sizeof(aIsPrime); i++) {
    if (aIsPrime[i]) {
      NumPrimes++;
    }
  }
}