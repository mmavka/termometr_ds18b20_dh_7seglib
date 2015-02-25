#ifndef HAL_H
#define HAL_H

//-------------------------#include---------------------------------------------
#include "../compilers/compilers.h"
#include "../macros/macros.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
#define BUT_DOWN        C, 0, ,
#define BUT_UP          C, 1, ,

//System Timer Config
#define Prescaler       64
#define	TimerDivider    (F_CPU/Prescaler/1000)	// 1 mS

#define HI(x) ((x)>>8)
#define LO(x) ((x)& 0xFF)
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
extern void InitAll(void);
//------------------------------------------------------------------------------

#endif  /* HAL_H */
