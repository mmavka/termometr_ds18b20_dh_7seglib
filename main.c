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
//���������� ��������� �� ���� 1Wire
#define MAX_DEVICES       One_Wire_Device_Number_MAX
//------------------------------------------------------------------------------

//-------------------------Global variables-------------------------------------
int16_t temper[MAX_DEVICES];                               // ����������� � �������
uint8_t rom_codes[MAX_DEVICES][DS18B20_SERIAL_NUM_SIZE];   // ������ ��������
uint8_t devices;                                           // ���������� ��������
uint8_t result;                                            // ��������� (������) ������ � ��������
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
void Update_7SegmentIND (void);         // ���������� 7-����������� ����������
void Search_ds18b20 (void);             // ����� ��������
void Start_Conversion_ds18b20 (void);   // ������ ��������� �����������
void Get_Result_ds18b20 (void);         // ��������� �����������
void Show_Temp1 (void);                 //
void Show_Temp2 (void);                 //
//------------------------------------------------------------------------------

//-------------------------Task aera--------------------------------------------
void Update_7SegmentIND (void)
{
  IND_Update();                                 //���������� ����������
  SetTimerTask(Update_7SegmentIND,1);           //���������� ������ ����� 1 ����
}

void Search_ds18b20 (void)
{
  DS18B20_Search_Rom(&devices,&rom_codes);      //����� ��������
  SetTimerTask(Search_ds18b20,10000);           //���������� ������ ������ 10 ���
}

void Start_Conversion_ds18b20 (void)
{
  DS18B20_Start_Conversion_Skip_Rom();          //����� ��������� ���� ��������
  SetTimerTask(Get_Result_ds18b20,800);         //������ ������ ����������� ����� 800 ����
}

void Get_Result_ds18b20 (void)
{
  for (i = 0; i<devices; i++){                  //������ ������ � ��������� �� ������
    result = DS18B20_Get_Conversion_Result_by_ROM_CRC(&rom_codes[i],(uint16_t*)&temper[i]);
    temper[i] = (((temper[i]>>4)*10)+(((temper[i]&0x0F)*10)>>4));
  }
  if( result == One_Wire_Success ) {            //���� ������ ���
    SetTimerTask(Start_Conversion_ds18b20,4200);//���� ����� 4.2 ��� �� ������ ���������
  } else {                                      //�����
    temper[0] = 8888;                           //������� 8888 � ����������� ��� ����� ������
    SetTimerTask(Get_Result_ds18b20,1200);      //� ������������ ������ �����������
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
  InitAll();			//�������������� ���������
  InitRTOS();			//�������������� ����
  RunRTOS();			//����� ����

  //uart_init();
  
  //������ �����
  SetTask(Update_7SegmentIND);
  SetTask(Search_ds18b20);
  SetTask(Start_Conversion_ds18b20);
  SetTask(Show_Temp1);
  
  IND_Init();
  
  while(1)
  {
    __watchdog_reset();	        // ����� ��������� �������
    TaskManager();	        // ����� ����������
  }
}

