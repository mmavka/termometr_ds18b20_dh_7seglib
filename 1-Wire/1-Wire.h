#ifndef ONEWIRE_H_
#define ONEWIRE_H_

//-------------------------#include---------------------------------------------
#include "../macros/macros.h"
#include "../compilers/compilers.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
#define Time_Pulse_Delay_Read	        10
#define Time_Pulse_Delay_Read_Wait	45
#define Time_Pulse_Delay_High		59
#define Time_Reset_Low			490
#define Time_Reset_Wait			70
#define Time_After_Reset		410
#define Time_Hold_Down			1

#define One_Wire_Read_ROM		0x33
#define One_Wire_Skip_ROM		0xCC
#define One_Wire_Search_ROM		0xF0
#define One_Wire_Match_ROM		0x55

#define One_Wire_Success		0x00
#define One_Wire_Error_No_Echo		0x01
#define One_Wire_Bus_Low_Error		0x02
#define One_Wire_Device_Busy		0x03
#define One_Wire_CRC_Error		0x04

#define ONE_WIRE        D, 6,,
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
uint8_t One_Wire_Reset(void);
void One_Wire_Write_Byte(uint8_t Byte);
uint8_t One_Wire_Read_Byte(void);
uint8_t One_Wire_Read_Bit (void);
void One_Wire_Write_Bit (uint8_t Bit);
//------------------------------------------------------------------------------

#endif /* ONEWIRE_H_ */
