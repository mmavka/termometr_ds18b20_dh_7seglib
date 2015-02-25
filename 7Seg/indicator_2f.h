//***************************************************************************
//
//  Author(s)...: Pashgan    http://ChipEnable.Ru   
//
//  Target(s)...: AVR
//
//  Compiler....: любой
//
//  Description.: Драйвер 7-ми сегментного индикатора 
//
//  Data........: 17.12.13  Создан  
//
//***************************************************************************
#ifndef INDICATOR_H
#define INDICATOR_H

#include "../compilers/compilers.h"
#include "port_macros.h"

/********************** настройки ***************************/

/*количество цифр индикатора*/
#define IND_AMOUNT_NUM    4

/*какая используется развертка*/
#define IND_SCAN_SEGMENT  0

/*используется ли фунция моргания*/
#define IND_USE_BLINK     0

/*период моргания индикатора*/
#define IND_DUR_BLINK    2000

/*куда подключены сегменты индикатора*/
#define IND_SEG_PORT   IND_SEG, B, _VIRT

#define IND_SEG_0      B, 2, _HI       //a
#define IND_SEG_1      B, 0, _HI       //b
#define IND_SEG_2      B, 6, _HI       //c
#define IND_SEG_3      B, 4, _HI       //d
#define IND_SEG_4      B, 3, _HI       //e
#define IND_SEG_5      B, 1, _HI       //f
#define IND_SEG_6      B, 7, _HI       //g
#define IND_SEG_7      B, 5, _HI       //dot

/*куда подключены разряды индикатора*/
#define IND_DIG_PORT   IND_DIG, D, _VIRT

#define IND_DIG_0      D, 2, _HI
#define IND_DIG_1      D, 4, _HI
#define IND_DIG_2      D, 5, _HI
#define IND_DIG_3      D, 3, _HI
#define IND_DIG_4      D, 0, _NONE
#define IND_DIG_5      D, 1, _NONE
#define IND_DIG_6      D, 6, _NONE
#define IND_DIG_7      D, 7, _NONE

/*
//куда подключены сегменты индикатора
#define IND_SEG_PORT   IND_SEG, A, _REAL

#define IND_SEG_0      A, 0, _LOW       //a
#define IND_SEG_1      A, 1, _LOW       //b
#define IND_SEG_2      A, 2, _LOW       //c
#define IND_SEG_3      A, 3, _LOW       //d
#define IND_SEG_4      A, 4, _LOW       //e
#define IND_SEG_5      A, 5, _LOW       //f
#define IND_SEG_6      A, 6, _LOW       //g
#define IND_SEG_7      A, 7, _LOW       //dot

//куда подключены разряды индикатора
#define IND_DIG_PORT   IND_DIG, D, _REAL

#define IND_DIG_0      D, 0, _HI
#define IND_DIG_1      D, 1, _HI
#define IND_DIG_2      D, 2, _HI
#define IND_DIG_3      D, 3, _HI
#define IND_DIG_4      D, 4, _HI
#define IND_DIG_5      D, 5, _HI
#define IND_DIG_6      D, 6, _HI
#define IND_DIG_7      D, 7, _HI
*/

/******************** Пользовательские функции **********************************/

void IND_Init(void);
void IND_OutSym(char *str, uint8_t pos);
void IND_OutUint(uint16_t value, uint8_t comma);
void IND_OutInt(int16_t value, uint8_t comma);
void IND_OutUintFormat(uint16_t value, uint8_t comma, uint8_t firstPos, uint8_t lastPos);
void IND_OutIntFormat(int16_t value, uint8_t comma, uint8_t firstPos, uint8_t lastPos);
void IND_BlinkMask(uint8_t value);
void IND_Update(void);
void IND_Clear(void);

#endif //INDICATOR_H