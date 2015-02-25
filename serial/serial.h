/*******************************************************************************
* File:     serial.h      
* Autor:    mmavka    
* Created:  02.08.2013
* Purpose:  
*******************************************************************************/
#ifndef SERIAL_H_
#define SERIAL_H_

//-------------------------#include---------------------------------------------
#include "../compilers/compilers.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
#define baudrate 4800L
#define bauddivider (F_CPU/(16*baudrate)-1)
#define HI(x) ((x)>>8)
#define LO(x) ((x)& 0xFF)
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
void uart_init(void);
void uart_putc(char data);
void uart_putvc(uint8_t val);
void uart_putvi(uint16_t val);
void uart_putvh(uint8_t val);
void uart_puts(char * string);
void uart_putsf(char __flash * string);
//------------------------------------------------------------------------------

#endif /* SERIAL_H_ */

