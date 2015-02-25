/*******************************************************************************
* File:    main.c      
* Autor:   mmavka    
* Created: DD.MM.YYYY
* Traget:   ( Hz)
*******************************************************************************/

//-------------------------#include---------------------------------------------
#include "compilers/compilers.h"
//#include "serial/serial.h"
#include "macros/macros.h"
#include "RTOS/EERTOS.h"
#include "ds18b20/ds18b20.h"
#include "7Seg/indicator_2f.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
//количество устройств на шине 1Wire
#define MAX_DEVICES       One_Wire_Device_Number_MAX
//------------------------------------------------------------------------------

//-------------------------Global variables-------------------------------------
int16_t temper[MAX_DEVICES];                               // температура с датчика
uint8_t rom_codes[MAX_DEVICES][DS18B20_SERIAL_NUM_SIZE];   // адреса датчиков
uint8_t devices;                                           // количество датчиков
uint8_t result;                                            // результат (ошибка) чтения с датчиков
uint8_t i;
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
//------------------------------------------------------------------------------

//-------------------------Interrupt--------------------------------------------
//RTOS Interrupt
ISR(RTOS_ISR)
{
TimerService();
}
//------------------------------------------------------------------------------

//-------------------------Task prototypes--------------------------------------
void Update_7SegmentIND (void);         // Обновление 7-сегментного индикатора
void Search_ds18b20 (void);             // Поиск датчиков
void Start_Conversion_ds18b20 (void);   // Запуск измерения температуры
void Get_Result_ds18b20 (void);         // Получение температуры
void Show_Temp1 (void);                 //
void Show_Temp2 (void);                 //
//------------------------------------------------------------------------------

//-------------------------Task aera--------------------------------------------
void Update_7SegmentIND (void)
{
  IND_Update();                                 //Обновление индикатора
  SetTimerTask(Update_7SegmentIND,1);           //постановка задачи через 1 мСек
}

void Search_ds18b20 (void)
{
  DS18B20_Search_Rom(&devices,&rom_codes);      //Поиск датчиков
  SetTimerTask(Search_ds18b20,10000);           //Обновление поиска каждые 10 Сек
}

void Start_Conversion_ds18b20 (void)
{
  DS18B20_Start_Conversion_Skip_Rom();          //Старт измерения всех датчиков
  SetTimerTask(Get_Result_ds18b20,800);         //запуск чтения результатов через 800 мСек
}

void Get_Result_ds18b20 (void)
{
  for (i = 0; i<devices; i++){                  //Читаем данные с проверкой на ошибки
    result = DS18B20_Get_Conversion_Result_by_ROM_CRC(&rom_codes[i],(uint16_t*)&temper[i]);
    temper[i] = (((temper[i]>>4)*10)+(((temper[i]&0x0F)*10)>>4));
  }
  if( result == One_Wire_Success ) {            //если ошибок нет
    SetTimerTask(Start_Conversion_ds18b20,4200);//идем через 4.2 Сек на запуск измерения
  } else {                                      //иначе
    temper[0] = 8888;                           //запишем 8888 в температуру для знака ошибки
    SetTimerTask(Get_Result_ds18b20,1200);      //и перезапустим чтение результатов
  }
}

void Show_Temp1 (void)
{
  IND_OutInt(temper[0],3);
  if( devices > 1 ) {
    SetTimerTask(Show_Temp2,5000);
  } else {
    SetTimerTask(Show_Temp1,5000);
  }

}
void Show_Temp2 (void)
{
  IND_OutInt(temper[1],3);
  SetTimerTask(Show_Temp1,5000);
}
//------------------------------------------------------------------------------

/*******************************************************************************
* Function name: main
* Returns:       0       
* Parameters:    none    
* Purpose:       main function       
*******************************************************************************/
void main( void )
{ 
  InitAll();			//Инициализируем перефирию
  InitRTOS();			//Инициализируем ядро
  RunRTOS();			//Старт ядра

  //uart_init();
  
  //Запуск задач
  SetTask(Update_7SegmentIND);
  SetTask(Search_ds18b20);
  SetTask(Start_Conversion_ds18b20);
  SetTask(Show_Temp1);
  
  IND_Init();
  
  while(1)
  {
    __watchdog_reset();	        // Сброс собачьего таймера
    TaskManager();	        // Вызов диспетчера
  }
}

