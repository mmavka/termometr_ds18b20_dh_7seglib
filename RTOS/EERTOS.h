#ifndef EERTOS_H
#define EERTOS_H

//-------------------------#include---------------------------------------------
#include "HAL.h"
#include "EERTOSHAL.h"
//------------------------------------------------------------------------------

//-------------------------typedef----------------------------------------------
typedef void (*TPTR)(void);
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
//RTOS Errors Пока не используются.
#define TaskSetOk	        'A'
#define TaskQueueOverflow	'B'
#define TimerUpdated		'C'
#define TimerSetOk		'D'
#define TimerOverflow		'E'
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
extern void InitRTOS(void);
extern void Idle(void);

extern void SetTask(TPTR TS);
extern void SetTimerTask(TPTR TS, uint16_t NewTime);
extern void DelTimerTask(TPTR TS);

extern void TaskManager(void);
extern void TimerService(void);
//------------------------------------------------------------------------------

#endif //EERTOS_H
