/**
 * \file timer_sw.h
 * \brief Software Timer
 */

#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

// --- Public types

typedef enum TimerSw_State_e {
  TIMER_STATE_STOPPED,
  TIMER_STATE_RUNNING,
  TIMER_STATE_AUTO_RELOAD,
} TimerSw_State_t;

typedef void (*TimerSw_Callback_t)(void* user_data);

typedef struct TimerSw_s {
  uint32_t elapsed_time_ms;
  uint32_t timeout_ms;
  TimerSw_Callback_t callback;
  TimerSw_State_t state;
  void* user_data;
} __attribute__((packed)) TimerSw_t;

// --- Public functions

/**
 * \brief Initialize timer
 * \param timer Timer to initialize
 * \param callback Callback to call when timeout
 * \param user_data User data to pass to callback
 */
void TimerSw_Init(TimerSw_t* const timer,
                  TimerSw_Callback_t callback,
                  void* user_data);

/**
 * \brief Set the timeout, one shot call
 * \param timer Timer to set timeout
 * \param timeout_ms Timeout in ms
 */
void TimerSw_SetTimeout(TimerSw_t* const timer, uint32_t timeout_ms);

/**
 * \brief Set interval, call periodically every period_ms
 * \param timer Timer to set interval
 * \param period_ms Period in ms
 */
void TimerSw_SetInterval(TimerSw_t* const timer, uint32_t period_ms);

void TimerSw_Stop(TimerSw_t* const timer);

void TimerSw_Tick(TimerSw_t* const timer, uint32_t period_ms);

#ifdef __cplusplus
}
#endif
