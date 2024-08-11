// Test code for blinking LED
#include "stm32f303x8.h"

// Simple timer function - written to get just a delay - don't count time correctly
void delay1(uint16_t time_ns){
    TIM1->CNT = 0;
    while(TIM1->CNT < time_ns);
}

void delay(uint16_t time_ms){
    for(int16_t i=0; i<time_ms; i++)
    {
      delay1(1000);
    }
}

int main(void)
{
  RCC->AHBENR |= (1 << 18U);          // Enable clock for GPIOB
  GPIOB->MODER = (0b01 << 6U);        // Set PB3 as output mode
  GPIOB->OTYPER |= (0 << 3U);         // Set PB3 as push-pull output
  GPIOB->BSRR |= (1 << 19U);          // Reset PB3 pin to 0

  RCC->APB2ENR |= (1 << 11U);         // Timer1 clock enable
  TIM1->PSC = 8 - 1;                  // Timer1 clock fcefuency
  TIM1->ARR = 0xffff;                 // Set auto-reload value for Timer1
  TIM1->CR1 = (1 << 0U);              // Enable Timer1
  while((!(TIM1->SR)) & (1 << 0U));   // Wait until timer1 start

  uint32_t delayTime = 1000;

  while (1)
  {
    GPIOB->BSRR |= (1 << 3U);         // Set PB3 to high state
    delay(delayTime);
    GPIOB->BSRR |= (1 << 19U);        // Set PB3 to low state
    delay(delayTime);
  }
}