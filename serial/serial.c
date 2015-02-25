#include "serial.h"

#if defined(__ATmega328__) || defined(__ATmega328P__) || defined(__ATmega88A__) || defined(__ATmega88PA__)
void uart_init(void)
{
  UBRR0L = LO(bauddivider); //USART Baud Rate Registers
  UBRR0H = HI(bauddivider); //USART Baud Rate Registers
  UCSR0A = ((0<<RXC0)|    //USART Receive Complete
            (0<<TXC0)|    //USART Transmit Complete
            (0<<UDRE0)|   //USART Data Register Empty
            (0<<FE0)|     //Frame Error
            (0<<DOR0)|    //Data OverRun
            (0<<UPE0)|    //USART Parity Error
            (0<<U2X0)|    //Double the USART Transmission Speed
            (0<<MPCM0));  //Multi-processor Communication Mode 
  
  UCSR0B = ((0<<RXCIE0)|  //RX Complete Interrupt Enable
            (0<<TXCIE0)|  //TX Complete Interrupt Enable
            (0<<UDRIE0)|  //USART Data Register Empty Interrupt Enable
            (0<<RXEN0)|   //Receiver Enable
            (1<<TXEN0)|   //Transmitter Enable
            (0<<UCSZ02)|  //Character Size
            (0<<RXB80)|   //Receive Data Bit 8
            (0<<TXB80));  //Transmit Data Bit 8
  
  UCSR0C = ((0<<UMSEL01)| //USART Mode Select
            (0<<UMSEL00)| //USART Mode Select
            (0<<UPM01)|   //Parity Mode
            (0<<UPM00)|   //Parity Mode
            (0<<USBS0)|   //Stop Bit Select
            (1<<UCSZ01)|  //Character Size
            (1<<UCSZ00)|  //Character Size
            (0<<UCPOL0)); //Clock Polarity
}

void uart_putc(char data)
{
  /* Wait for empty transmit buffer */
  while ( !( UCSR0A & (1<<UDRE0)) );
  /* Put data into buffer, sends the data */
  UDR0 = data;
}
#elif defined(__ATmega8__) || defined(__ATmega8A__) || defined(__ATmega16__) || defined(__ATmega16A__)
void uart_init(void)
{
  UBRRL = LO(bauddivider);
  UBRRH = HI(bauddivider);
  UCSRA = ((0<<RXC)|     //USART Receive Complete
            (0<<TXC)|     //USART Transmit Complete
            (0<<UDRE)|    //USART Data Register Empty
            (0<<FE)|      //Frame Error
            (0<<DOR)|     //Data OverRun
            (0<<PE)|      //USART Parity Error
            (0<<U2X)|     //Double the USART Transmission Speed
            (0<<MPCM));   //Multi-processor Communication Mode 
  
  UCSRB = ((0<<RXCIE)|   //RX Complete Interrupt Enable
            (0<<TXCIE)|   //TX Complete Interrupt Enable
            (0<<UDRIE)|   //USART Data Register Empty Interrupt Enable
            (0<<RXEN)|    //Receiver Enable
            (1<<TXEN)|    //Transmitter Enable
            (0<<UCSZ2)|   //Character Size
            (0<<RXB8)|    //Receive Data Bit 8
            (0<<TXB8));   //Transmit Data Bit 8
  
  UCSRC = ((1<<URSEL)|   //Register Select
            (0<<UMSEL)|   //USART Mode Select
            (0<<UPM1)|    //Parity Mode
            (0<<UPM0)|    //Parity Mode
            (0<<USBS)|    //Stop Bit Select
            (1<<UCSZ1)|   //Character Size
            (1<<UCSZ0)|   //Character Size
            (0<<UCPOL));  //Clock Polarity
}

void uart_putc(char data)
{
  /* Wait for empty transmit buffer */
  while ( !( UCSRA & (1<<UDRE)) );
  /* Put data into buffer, sends the data */
  UDR = data;
}
  
#elif defined(__ATtiny2313__) || defined(__ATtiny2313A__)
void uart_init(void)
{
  UBRRL = LO(bauddivider);
  UBRRH = HI(bauddivider);
  UCSRA = ((0<<RXC)|      //USART Receive Complete
            (0<<TXC)|     //USART Transmit Complete
            (0<<UDRE)|    //USART Data Register Empty
            (0<<FE)|      //Frame Error
            (0<<DOR)|     //Data OverRun
            (0<<UPE)|     //USART Parity Error
            (0<<U2X)|     //Double the USART Transmission Speed
            (0<<MPCM));   //Multi-processor Communication Mode 
  
  UCSRB = ((0<<RXCIE)|    //RX Complete Interrupt Enable
            (0<<TXCIE)|   //TX Complete Interrupt Enable
            (0<<UDRIE)|   //USART Data Register Empty Interrupt Enable
            (0<<RXEN)|    //Receiver Enable
            (1<<TXEN)|    //Transmitter Enable
            (0<<UCSZ2)|   //Character Size
            (0<<RXB8)|    //Receive Data Bit 8
            (0<<TXB8));   //Transmit Data Bit 8
  
  UCSRC = ((0<<UMSEL)|  //USART Mode Select
            (0<<UPM1)|    //Parity Mode
            (0<<UPM0)|    //Parity Mode
            (0<<USBS)|    //Stop Bit Select
            (1<<UCSZ1)|   //Character Size
            (1<<UCSZ0)|   //Character Size
            (0<<UCPOL));  //Clock Polarity
}

void uart_putc(char data)
{
  /* Wait for empty transmit buffer */
  while ( !( UCSRA & (1<<UDRE)) );
  /* Put data into buffer, sends the data */
  UDR = data;
}  
#else
  #warning Not initialize UART 
#endif

void uart_putvc(uint8_t val)
{
  char buffer[3] = {0};
  char * head = buffer;
  uint8_t cnt=0;
  if (val!=0)
  {
    while( val )
    {
      //*head++ = (val % 10)["0123456789"];
      *head++ = (val % 10) + '0';
      val /= 10;
      cnt++;
    }
    while (cnt!=0){ cnt--; uart_putc(buffer[cnt]); }
  }
  else
  {
    uart_putc('0');
  }
}

void uart_putvi(uint16_t val)
{
  char buffer[5] = {0};
  char * head = buffer;
  uint8_t cnt=0;
  if (val!=0)
  {
    while( val )
    {
      //*head++ = (val % 10)["0123456789"];
      *head++ = (val % 10) + '0';
      val /= 10;
      cnt++;
    }
    while (cnt!=0){ cnt--; uart_putc(buffer[cnt]); }
  }
  else
  {
    uart_putc('0');
  }
}

void uart_putvh(uint8_t val)
{
  char buffer[2] = {0};
  char * head = buffer;
  uint8_t cnt=0;
  uart_putc('0');
  uart_putc('x');
  if (val<=0x0F)
    uart_putc('0');
  if (val!=0)
  {
    while( val )
    {
      //*head++ = (val & 0x0F)["0123456789ABCDEF"];
      *head++ = ((val & 0x0f) > 9) ? ((val & 0x0f) + 'A' - 10) : ((val & 0x0f) + '0');
      val=val>>4;
      cnt++;
    }
    while (cnt!=0){ cnt--; uart_putc(buffer[cnt]); }
  }
  else
  {
    uart_putc('0');
  }
  uart_putc(' ');
}

void uart_puts(char * string)
{
  while (*string != 0x00){ uart_putc(*string++);}
}

void uart_putsf(char __flash * string)
{
  while (*string != 0x00){ uart_putc(*string++);}
}