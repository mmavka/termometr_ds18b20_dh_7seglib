#include "1-Wire.h"

//*********************************************************************************************
//function  ������� ������                                                                   //
//argument  ����, ���                                                                        //
//return    One_Wire_Success - ���������� ����������, One_Wire_Error_No_Echo - �� ����������,// 
//					One_Wire_Bus_Low_Error - �.�. �� �����                                   //
//*********************************************************************************************

uint8_t One_Wire_Reset(void)								
{
  uint8_t tmp;			         //��������� ����������
  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();

  Pin_HiZ(ONE_WIRE);                      //��������� ����
  if (Pin_Is_Clear(ONE_WIRE))
  {                                       //��������� ���� �� ��	
    __restore_interrupt(intState);        //Restore interrupts.
    return One_Wire_Bus_Low_Error;
  }		
  Pin_Out_Low(ONE_WIRE);                  //�������� ���� � �����
  Delay_us(Time_Reset_Low);		  //����� 480 �����������		
  Pin_HiZ(ONE_WIRE);                      //��������� ����
  Delay_us(Time_Reset_Wait);	          //����� 70 �����������
  if (Pin_Is_Clear(ONE_WIRE)) 
    tmp=One_Wire_Success;		  //��������� ����
  else 
    tmp=One_Wire_Error_No_Echo;
  Delay_us(Time_After_Reset);	          //��������� ��������� �������������

  __restore_interrupt(intState);          // Restore interrupts.

  return tmp;
}

//*********************************************************************************************
//function  ������ �����                                                                     //
//argument  ������������ ����, ����, ���                                                     //
//return    none                                                                             //
//*********************************************************************************************
void One_Wire_Write_Byte(uint8_t Byte)
{
  uint8_t i;
  for(i = 0; i < 8; i++) 
    One_Wire_Write_Bit(Byte & (1 << i));
}

//*********************************************************************************************
//function  �������� ����                                                                    //
//argument  �������� ������������� ����, ����, ���                                           //
//return    none                                                                             //
//*********************************************************************************************
void One_Wire_Write_Bit (uint8_t Bit)
{

  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();

  Pin_Out_Low(ONE_WIRE);                  //�������� ���� � �����	
  Delay_us(Time_Hold_Down);	          //����� 1 ������������
  if(Bit) 
    Pin_HiZ(ONE_WIRE);                    //���� �������� 1, �� ��������� ����
  Delay_us(Time_Pulse_Delay_High);	  //�������� 59 �����������
  Pin_HiZ(ONE_WIRE);                      //��������� ����

  // Restore interrupts.
  __restore_interrupt(intState);  
} 

//*********************************************************************************************
//function  ������ �����                                                                     //
//argument  ���, ����                                                                        //
//return    ����������� ����                                                                 //
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
//function  ������ ����                                                                      //
//argument  ����, ���                                                                        //
//return    ����������� ���                                                                  //
//*********************************************************************************************
uint8_t One_Wire_Read_Bit (void)
{
  uint8_t result;
  uint8_t intState;

  // Disable interrupts.
  intState = __save_interrupt();
  __disable_interrupt();
  
  Pin_Out_Low(ONE_WIRE);                        //�������� ���� � �����	
  Delay_us(Time_Hold_Down);
  Pin_HiZ(ONE_WIRE);                            //��������� ����
  Delay_us(Time_Pulse_Delay_Read);	        //�������� 15 �����������
  result = Pin_State(ONE_WIRE);                 //��������� ����
  Delay_us(Time_Pulse_Delay_Read_Wait); 	//���������� �����

  // Restore interrupts.
  __restore_interrupt(intState);  

  return result;					//���������� ���������
}