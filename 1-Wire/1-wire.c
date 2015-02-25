#include "1-Wire.h"

//*********************************************************************************************
//function  импульс сброса                                                                   //
//argument  Порт, Пин                                                                        //
//return    One_Wire_Success - устройство обнаружено, One_Wire_Error_No_Echo - не обнаружено,// 
//					One_Wire_Bus_Low_Error - к.з. на линии                                   //
//*********************************************************************************************

uint8_t One_Wire_Reset(void)								
{
  uint8_t tmp;			         //временная переменная
  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();

  Pin_HiZ(ONE_WIRE);                      //отпустить шину
  if (Pin_Is_Clear(ONE_WIRE))
  {                                       //Проверяем шину на КЗ	
    __restore_interrupt(intState);        //Restore interrupts.
    return One_Wire_Bus_Low_Error;
  }		
  Pin_Out_Low(ONE_WIRE);                  //Потянуть шину к земле
  Delay_us(Time_Reset_Low);		  //ждать 480 микросекунд		
  Pin_HiZ(ONE_WIRE);                      //отпустить шину
  Delay_us(Time_Reset_Wait);	          //ждать 70 микросекунд
  if (Pin_Is_Clear(ONE_WIRE)) 
    tmp=One_Wire_Success;		  //прочитать шину
  else 
    tmp=One_Wire_Error_No_Echo;
  Delay_us(Time_After_Reset);	          //дождаться окончания инициализации

  __restore_interrupt(intState);          // Restore interrupts.

  return tmp;
}

//*********************************************************************************************
//function  запись байта                                                                     //
//argument  передаваемый байт, порт, пин                                                     //
//return    none                                                                             //
//*********************************************************************************************
void One_Wire_Write_Byte(uint8_t Byte)
{
  uint8_t i;
  for(i = 0; i < 8; i++) 
    One_Wire_Write_Bit(Byte & (1 << i));
}

//*********************************************************************************************
//function  передача бита                                                                    //
//argument  значение передаваемого бита, порт, пин                                           //
//return    none                                                                             //
//*********************************************************************************************
void One_Wire_Write_Bit (uint8_t Bit)
{

  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();

  Pin_Out_Low(ONE_WIRE);                  //Потянуть шину к земле	
  Delay_us(Time_Hold_Down);	          //ждать 1 микросекунду
  if(Bit) 
    Pin_HiZ(ONE_WIRE);                    //если передаем 1, то отпускаем шину
  Delay_us(Time_Pulse_Delay_High);	  //задержка 59 микросекунд
  Pin_HiZ(ONE_WIRE);                      //отпустить шину

  // Restore interrupts.
  __restore_interrupt(intState);  
} 

//*********************************************************************************************
//function  чтение байта                                                                     //
//argument  пин, порт                                                                        //
//return    прочитанный байт                                                                 //
//*********************************************************************************************
uint8_t One_Wire_Read_Byte(void)
{
  uint8_t i,result = 0;
  
  for(i = 0; i < 8; i++)
    if (One_Wire_Read_Bit())
      result |= 1 << i;
  return result;
}

//*********************************************************************************************
//function  чтение бита                                                                      //
//argument  порт, пин                                                                        //
//return    прочитанный бит                                                                  //
//*********************************************************************************************
uint8_t One_Wire_Read_Bit (void)
{
  uint8_t result;
  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();
  
  Pin_Out_Low(ONE_WIRE);                        //Потянуть шину к земле	
  Delay_us(Time_Hold_Down);
  Pin_HiZ(ONE_WIRE);                            //отпустить шину
  Delay_us(Time_Pulse_Delay_Read);	        //задержка 15 микросекунд
  result = Pin_State(ONE_WIRE);                 //прочитать шину
  Delay_us(Time_Pulse_Delay_Read_Wait); 	//оставшееся время

  // Restore interrupts.
  __restore_interrupt(intState);  

  return result;					//возвратить результат
}