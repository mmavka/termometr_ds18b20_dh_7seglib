#ifndef DS18B20_H_
#define DS18B20_H_

//-------------------------#include---------------------------------------------
#include "../compilers/compilers.h"
#include "../1-Wire/1-wire.h"
#include "../CRC/CRC.h"
//------------------------------------------------------------------------------

//-------------------------#define----------------------------------------------
#define DS18B20_CONVERT_T_CMD			0x44
#define DS18B20_WRITE_STRATCHPAD_CMD		0x4E
#define DS18B20_READ_STRATCHPAD_CMD		0xBE
#define DS18B20_COPY_STRATCHPAD_CMD		0x48
#define DS18B20_RECALL_E_CMD			0xB8
#define DS18B20_READ_POWER_SUPPLY_CMD		0xB4

#define DS18B20_STRATCHPAD_SIZE			0x09
#define DS18B20_SERIAL_NUM_SIZE			0x08

#define One_Wire_Device_Number_MAX		2	//maximum number of 1-wire devices on bus6
//------------------------------------------------------------------------------

//-------------------------The function prototypes------------------------------
/*uint8_t DS18B20_Search_Rom2 (uint8_t *buf, uint8_t num);*/
uint8_t DS18B20_Start_Conversion_by_ROM (uint8_t (*Serial_Num)[DS18B20_SERIAL_NUM_SIZE]);
uint8_t DS18B20_Search_Rom (uint8_t *devices_found, uint8_t (*SN_ROM)[One_Wire_Device_Number_MAX][DS18B20_SERIAL_NUM_SIZE]);
uint8_t DS18B20_Get_Conversion_Result_by_ROM_CRC (uint8_t (*Serial_Num)[DS18B20_SERIAL_NUM_SIZE], uint16_t * temp_code);
uint8_t DS18B20_Start_Conversion_Skip_Rom (void);		 
//------------------------------------------------------------------------------

#endif /* DS18B20_H_ */
