#include "EERTOS.h"


// ������� �����, ��������.
// ��� ������ - ��������� �� �������
volatile static TPTR	TaskQueue[TaskQueueSize + 1];	        // ������� ����������
volatile static struct {TPTR GoToTask; 			        // ��������� ��������
                        uint16_t Time;			        // �������� � ��
                       } MainTimer[MainTimerQueueSize + 1];     // ������� ��������


/**************************************************************************
*   Function name :   InitRTOS
*   Returns :         none       
*   Parameters :      none    
*   Purpose :         RTOS ����������. ������� ��������        
****************************************************************************/
inline void InitRTOS(void)
{
  uint8_t index;

  for (index = 0; index != TaskQueueSize + 1; index++)  // �� ��� ������� ���������� Idle
  {
    TaskQueue[index] = Idle;
  }
  
  for (index = 0; index != MainTimerQueueSize + 1; index++)// �������� ��� �������.
  {
    MainTimer[index].GoToTask = Idle;
    MainTimer[index].Time = 0;
  }
}

/**************************************************************************
*   Function name :   Idle
*   Returns :                
*   Parameters :          
*   Purpose :         ������ ��������� - ������� ����.       
****************************************************************************/
inline void  Idle(void)
{
}

/**************************************************************************
*   Function name :   SetTask
*   Returns :         ��� ������       
*   Parameters :      1 - ��������� �� �������    
*   Purpose :         ������� ��������� ������ � �������       
****************************************************************************/
void SetTask(TPTR TS)
{

  uint8_t index = 0;
  uint8_t intState;

intState = __save_interrupt();
        __disable_interrupt();

  // ��� ������� ���� ATOMI� RESTORSTATE ������ ����������� ������� � ������� ���
  // ���������������������. ��� ������, ��� SREG ���� �� �����������, �� �������� � 
  // ��������. ��� �������� �� ������ ���������������, ��������, �� �51 ��� ������ 
  // ���� ������ ���������. � ���������� ���� ���������� ���������. ��� �����
  // ���������� ����������� ��������. 

  // � ��� � ���������� ������ � �������.
  while(TaskQueue[index] != Idle)                       // ����������� ������� ����� �� ������� ��������� ������
  {                                                     // � ��������� Idle - ����� �������.
    index++;
    if (index == TaskQueueSize + 1)                     // ���� ������� ����������� �� ������� �� ������ ��������
    {
      __restore_interrupt(intState);                    // ���� �� �� � ����������, �� ��������� ����������
      return;				                // ������ ������� ���������� ��� ������ - ������� �����������. ���� �����.
    }
  }
                                                        // ���� ����� ��������� �����, ��
  TaskQueue[index] = TS;			        // ���������� � ������� ������
  __restore_interrupt(intState);                        // � �������� ���������� ���� �� � ����������� ����������.
}


/**************************************************************************
*   Function name :   SetTimerTask
*   Returns :         ��� ������       
*   Parameters :      1 - ��������� �� �������, 2 - ����� �������� � ����� ���������� �������    
*   Purpose :         ������� ��������� ������ �� �������       
****************************************************************************/
void SetTimerTask(TPTR TS, uint16_t NewTime)
{
  uint8_t index;
  uint8_t intState;

  intState = __save_interrupt();
             __disable_interrupt();

  for (index = 0; index != MainTimerQueueSize + 1; ++index)// ����������� ������� ��������
  {
    if(MainTimer[index].GoToTask == TS)                 // ���� ��� ���� ������ � ����� �������
    {
      MainTimer[index].Time = NewTime;                  // �������������� �� ��������
      __restore_interrupt(intState);                    // ��������� ���������� ���� �� ���� ���������.
      return;	                                        // �������. ������ ��� ��� �������� ��������. ���� �����
    }   
  }
          
  for (index = 0; index != MainTimerQueueSize + 1; ++index)// ���� �� ������� ������� ������, �� ���� ����� ������	
  {
    if (MainTimer[index].GoToTask == Idle)		
    {
      MainTimer[index].GoToTask = TS;	                // ��������� ���� �������� ������
      MainTimer[index].Time = NewTime;                  // � ���� �������� �������
      __restore_interrupt(intState);	                // ��������� ����������
    return;				                // �����. 
    }           
  }					                // ��� ����� ������� return c ����� ������ - ��� ��������� ��������
  __restore_interrupt(intState);	                // ��������� ���������� ���� �� ���� ���������.
}

/**************************************************************************
*   Function name :   DelTimerTask
*   Returns :         none       
*   Parameters :      1 - ��������� �� �������    
*   Purpose :         ������� �������� ������ �� �������       
****************************************************************************/
void DelTimerTask(TPTR TS)
{
  uint8_t index;
  uint8_t intState;

  intState = __save_interrupt();
             __disable_interrupt();


  for (index = 0; index != MainTimerQueueSize + 1; ++index)//����������� ������� ��������
  {
    if(MainTimer[index].GoToTask == TS)                 // ���� ��� ���� ������ � ����� �������
    {
      MainTimer[index].GoToTask = Idle;                 // ����� �������
      MainTimer[index].Time = 0;
      __restore_interrupt(intState);                    // ��������� ���������� ���� �� ���� ���������.
      return;                                           // �������. ������ ��� ��� �������� ��������. ���� �����
    }
  }                                                     // ��� ����� ������� return c ����� ������ - ��� ��������� ��������
  __restore_interrupt(intState);	                // ��������� ���������� ���� �� ���� ���������.
}

/**************************************************************************
*   Function name :   TaskManager
*   Returns :         none       
*   Parameters :      none    
*   Purpose :         ��������� ����� ��. �������� �� ������� ������ � ���������� �� ����������.       
****************************************************************************/
inline void TaskManager(void)
{
  uint8_t index;
  TPTR GoToTask = Idle;		                        // �������������� ����������

  // ��� ������, ��� ���� ��������� Idle - ������� �� ��������� ������� ����.
  // �� ��� ����� �������� ��� ������ ������ �������, �������� ���������� �������� =)  
  // � ��������� ����������-��������� GoToTask ���� �� ����� ����� ������ ���������

  __disable_interrupt();			        // ��������� ����������!!!

  // ��������� ����������!!! ��� ������. ������� ��� ; � �����. 
  // ������ �� CLI()? ��� ������� AVR, � � ����� ������� �����������
  // �������������������� ���������. ���������� ���� ��������� ������, ���
  // ���� ��������� � ���������� ������� ����������. �� ����� ������ � ����������
  // ������� ��������� �� ����������� ��������. 

  GoToTask = TaskQueue[0];		                // ������� ������ �������� �� �������

  if (GoToTask == Idle)			                // ���� ��� �����
  {
    __enable_interrupt();			        // ��������� ����������
    (Idle)(); 				                // ��������� �� ��������� ������� �����
  }
  else
  {
    for (index = 0; index != TaskQueueSize; index++)    // � ��������� ������ �������� ��� �������
    {
      TaskQueue[index] = TaskQueue[index + 1];
    }
    TaskQueue[TaskQueueSize] = Idle;		        // � ��������� ������ ������ �������
    __enable_interrupt();			        // ��������� ����������
    (GoToTask)();				        // ��������� � ������
  }
}


/**************************************************************************
*   Function name :   TimerService
*   Returns :                
*   Parameters :          
*   Purpose :         ������ �������� ����.
*   NOTE:             ������ ���������� �� ���������� ��� � 1��. ���� ����� ����� ����������� � ����������� �� ������
*                     To DO: �������� � ����������� ��������� ������������ ������� ��������. ����� ����� ����� ��������� �� ����� ������. 
*                     � ����� ������������ ��� ������� ������������ �������. 
*                     � ���� ������ �� ������ �������� �������� ����������.
****************************************************************************/
inline void TimerService(void)
{
  uint8_t index;

  for (index = 0; index != MainTimerQueueSize + 1; index++)// ����������� ������� ��������
  {
    if (MainTimer[index].GoToTask == Idle) continue;    // ���� ����� �������� - ������� ��������� ��������
    if (MainTimer[index].Time != 1)		        // ���� ������ �� ��������, �� ������� ��� ���. 
    {				                        // To Do: ��������� �� ������, ��� ����� !=1 ��� !=0. 
      MainTimer[index].Time--;	                        // ��������� ����� � ������ ���� �� �����.
    }
    else
    {
      SetTask(MainTimer[index].GoToTask);               // ��������� �� ����? ������ � ������� ������
      MainTimer[index].GoToTask = Idle;                 // � � ������ ����� �������
    }
  }
}
