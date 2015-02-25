#include "EERTOSHAL.h"

//RTOS Запуск системного таймера
inline void RunRTOS (void)
{
  TCCR2 = 1<<WGM21|4<<CS20; 			// Freq = CK/64 - Установить режим и предделитель
						// Автосброс после достижения регистра сравнения
  TCNT2 = 0;					// Установить начальное значение счётчиков
  OCR2  = LO(TimerDivider); 			// Установить значение в регистр сравнения
  TIMSK = 0<<TOIE0|1<<OCF2|0<<TOIE0;		// Разрешаем прерывание RTOS - запуск ОС
  
  __enable_interrupt();
}
