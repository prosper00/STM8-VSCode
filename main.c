/**********************
Primes benchmark. Measures the number of times the mcu can iterate through the
primes calc function in 1000ms.


**********************/

/*----------------------------------------------------------
    INCLUDE FILES
----------------------------------------------------------*/
#include "STM8S103F3.h"
#include "primes.h"
#include <stdint.h>
#include <stdio.h>

#define _MAIN_ // required for global variables
#include "timer4.h"
#include "uart.h"
#undef _MAIN_

/**
  \fn int putchar(int byte)

  \brief output routine for printf()

  \param[in]  data   byte to send

  \return  sent byte

  implementation of putchar() for printf(), using selected output channel.
  Use send routine set via putchar_attach()
  Return type depends on used compiler (see respective stdio.h)
*/
int putchar(int data) {

  // send byte
  UART_write(data);

  // return sent byte
  return (data);

} // putchar

/////////////////
//    main routine
/////////////////
void main(void) {

  // disable interrupts
  DISABLE_INTERRUPTS();

  // switch to 16MHz (default is 2MHz)
  sfr_CLK.CKDIVR.byte = 0x00;

  // configure LED pin as output
  sfr_PORTB.DDR.DDR5 = 1; // input(=0) or output(=1)
  sfr_PORTB.CR1.C15 =
      1; // input: 0=float, 1=pull-up; output: 0=open-drain, 1=push-pull
  sfr_PORTB.CR2.C25 =
      1; // input: 0=no exint, 1=exint; output: 0=2MHz slope, 1=10MHz slope

  // init UART for 19.2kBaud
  UART_begin(19200);

  // init 1ms interrupt
  TIM4_init();

  // enable interrupts
  ENABLE_INTERRUPTS();

  uint32_t tEnd = 0;
  uint16_t Cnt = 0;

  // main loop
  while (1) {
    tEnd = (millis() + 1000);
    Cnt = 0;

    while (tEnd >= millis()) {
      _CalcPrimes();
      Cnt++;
    }
    printf("CNT = %d \n", Cnt);
    sfr_PORTB.ODR.ODR5 ^= 1;
    tEnd = 0;
  } // main loop

} // main

/*-----------------------------------------------------------------------------
    END OF MODULE
-----------------------------------------------------------------------------*/
