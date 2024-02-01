
#include "timer_sw/timer_sw.h"

int main()
{
  TimerSw_t timer;
  TimerSw_Init(&timer, nullptr, nullptr);
  TimerSw_Tick(&timer, 10U);
}
