/**
  \file uart.h
   
  \author G. Icking-Konert
  \date 2017-02-19
  \version 0.1
   
  \brief declaration of UART functions/macros
   
  declaration of UART functions.
*/

/*-----------------------------------------------------------------------------
    MODULE DEFINITION FOR MULTIPLE INCLUSION
-----------------------------------------------------------------------------*/
#ifndef _UART_H_
#define _UART_H_

/*----------------------------------------------------------
    INCLUDE FILES
----------------------------------------------------------*/
#include <stdint.h>
#include "STM8S103F3.h"


/*----------------------------------------------------------
    GLOBAL MACROS
----------------------------------------------------------*/

  /// check if byte received via UART2
  #define UART_available()   ( sfr_UART1.SR.RXNE )

  /// read received byte from UART2
  #define UART_read()        ( sfr_UART1.DR.byte )

  /// send byte via UART2
  #define UART_write(x)	     { while (!(sfr_UART1.SR.TXE)); sfr_UART1.DR.byte = x; }

  /// flush UART2
  #define UART_flush()	     { while (!(sfr_UART1.SR.TC)); }

// error 



/*----------------------------------------------------------
    GLOBAL FUNCTIONS
----------------------------------------------------------*/

/// initialize UART
void UART_begin(uint32_t BR);


/*-----------------------------------------------------------------------------
    END OF MODULE DEFINITION FOR MULTIPLE INLUSION
-----------------------------------------------------------------------------*/
#endif // _UART_H_
