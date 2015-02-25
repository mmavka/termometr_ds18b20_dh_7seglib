#include "ds18b20.h"

uint8_t DS18B20_Start_Conversion_by_ROM (uint8_t (*Serial_Num)[DS18B20_SERIAL_NUM_SIZE])
{
  uint8_t cnt;
  
  cnt = One_Wire_Reset();
  if (cnt != One_Wire_Success) 
    return cnt;
  One_Wire_Write_Byte(One_Wire_Match_ROM);
  for (cnt = 0; cnt != 8; cnt++) 
    One_Wire_Write_Byte((*Serial_Num)[cnt]);
  One_Wire_Write_Byte(DS18B20_CONVERT_T_CMD);
  return One_Wire_Success;
}

uint8_t DS18B20_Search_Rom (uint8_t *devices_found, uint8_t (*SN_ROM)[One_Wire_Device_Number_MAX][DS18B20_SERIAL_NUM_SIZE])
{
  uint32_t path,next,pos;                                                       
  uint8_t bit,chk;                                
  uint8_t cnt_bit, cnt_byte, cnt_num,tmp;
  
  path = 0;                                     
  cnt_num = 0;
  do
  {                                         
    tmp = One_Wire_Reset();
    if (tmp != One_Wire_Success) 
    {
      *devices_found = 0; 
      return tmp;
    }
    One_Wire_Write_Byte(One_Wire_Search_ROM);
    next = 0;                                 
    pos = 1;                                                             
    for (cnt_byte = 0; cnt_byte != 8; cnt_byte++)
    {
      (*SN_ROM)[cnt_num][cnt_byte] = 0;
      for (cnt_bit = 0; cnt_bit != 8; cnt_bit++)
      {                                     
        bit = One_Wire_Read_Bit();
        chk = One_Wire_Read_Bit();
        if(!bit && !chk)
        {                   
          if(pos & path) 
            bit = 1;            
          else 
            next = (path & (pos - 1)) | pos;   
          pos <<= 1;
        }
        One_Wire_Write_Bit(bit);
        if (bit != 0) (*SN_ROM)[cnt_num][cnt_byte] |= (1 << cnt_bit);
      }
    }
    path = next;
    cnt_num++;
  }while(path);
  
  * devices_found = cnt_num;
  return One_Wire_Success;
}

uint8_t DS18B20_Get_Conversion_Result_by_ROM_CRC (uint8_t (*Serial_Num)[DS18B20_SERIAL_NUM_SIZE], uint16_t * temp_code)
{
  uint8_t cnt;
  uint8_t inbuff[DS18B20_STRATCHPAD_SIZE];
  
  cnt = One_Wire_Reset();
  if (cnt != One_Wire_Success) 
    return cnt;
  One_Wire_Write_Byte(One_Wire_Match_ROM);
  for (cnt = 0; cnt != 8; cnt++) 
    One_Wire_Write_Byte((*Serial_Num)[cnt]);
  One_Wire_Write_Byte(DS18B20_READ_STRATCHPAD_CMD);
  for (cnt = 0; cnt != DS18B20_STRATCHPAD_SIZE; cnt++) 
    inbuff[cnt] = One_Wire_Read_Byte();
  if (Crc8Dallas(DS18B20_STRATCHPAD_SIZE,inbuff) == 0) 
    *temp_code = inbuff[0] | (inbuff[1] << 8);
  else	
    return One_Wire_CRC_Error;
  return One_Wire_Success;
}

uint8_t DS18B20_Start_Conversion_Skip_Rom (void)			 
{	
  uint8_t tmp; 											
  
  tmp = One_Wire_Reset();
  if (tmp != One_Wire_Success) 
    return tmp;												
  One_Wire_Write_Byte(One_Wire_Skip_ROM);
  One_Wire_Write_Byte(DS18B20_CONVERT_T_CMD);
  if (One_Wire_Read_Byte() == 0)	
    return One_Wire_Success; 
  else 
    return One_Wire_Device_Busy;
}
