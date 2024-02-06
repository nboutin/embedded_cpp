/**
 * \file timer.c
 * \brief Timer
 * \author Nicolas Boutin
 * \date 2023-02
 */

#include <stddef.h>

#include "dlt/dlt_client.h"

#include "timer_sw.h"

void TimerSw_Init(TimerSw_t* const timer,
                  TimerSw_Callback_t callback,
                  void* user_data)
{
  app_id_t app_id = "TEST";
  dlt_context_t dlt_context;
  ctx_id_t ctx_id = "CTX1";
  DLT_RegisterApp(app_id, "Test application");
  DLT_RegisterContext(&dlt_context, app_id, ctx_id, "Test context");

  if (timer != NULL)
  {
    timer->elapsed_time_ms = 0;
    timer->timeout_ms      = 0;
    timer->state           = TIMER_STATE_STOPPED;
    timer->callback        = callback;
    timer->user_data       = user_data;
  }
}

void TimerSw_SetTimeout(TimerSw_t* const timer, uint32_t timeout_ms)
{
  if (timer != NULL)
  {
    timer->elapsed_time_ms = 0;
    timer->timeout_ms      = timeout_ms;
    timer->state           = TIMER_STATE_RUNNING;
  }
}

void TimerSw_SetInterval(TimerSw_t* const timer, uint32_t period_ms)
{
  if (timer != NULL)
  {
    timer->elapsed_time_ms = 0;
    timer->timeout_ms      = period_ms;
    timer->state           = TIMER_STATE_AUTO_RELOAD;
  }
}

void TimerSw_Stop(TimerSw_t* const timer)
{
  if (timer != NULL)
  {
    timer->elapsed_time_ms = 0;
    timer->state           = TIMER_STATE_STOPPED;
  }
}

void TimerSw_Tick(TimerSw_t* timer, uint32_t period_ms)
{
  if ((timer != NULL) && (timer->state != TIMER_STATE_STOPPED))
  {
    timer->elapsed_time_ms += period_ms;

    // Timeout reached
    if (timer->elapsed_time_ms >= timer->timeout_ms)
    {
      // Reload
      timer->elapsed_time_ms = 0;

      if (timer->state == TIMER_STATE_RUNNING)
      {
        timer->state = TIMER_STATE_STOPPED;
      }
      else if (timer->state == TIMER_STATE_AUTO_RELOAD)
      {
        // do nothing
      }
      else
      {
        // do nothing
      }

      if (timer->callback != NULL)
      {
        timer->callback(timer->user_data);
      }
    }
  }
}
