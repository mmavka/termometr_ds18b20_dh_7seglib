#ifndef EERTOSHAL_H
#define EERTOSHAL_H

//-------------------------#include---------------------------------------------
#include "HAL.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
#define STATUS_REG 		SREG
#define Interrupt_Flag		7
#define Disable_Interrupt	cli();
#define Enable_Interrupt	sei();

//RTOS Config
#define RTOS_ISR  		TIMER2_COMP_vect
#define	TaskQueueSize		10
#define MainTimerQueueSize	5
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
extern void RunRTOS (void);
//------------------------------------------------------------------------------

#endif //EERTOSHAL_H
