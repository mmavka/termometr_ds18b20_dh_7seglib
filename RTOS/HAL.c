#include "HAL.h"

inline void InitAll(void)
{
  Pin_In_PullUp(BUT_DOWN);
  Pin_In_PullUp(BUT_UP);
}



