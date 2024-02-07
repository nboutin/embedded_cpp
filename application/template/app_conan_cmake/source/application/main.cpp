
#include "component_c/component_c.h"
#include "dlt/dlt_client.h"
#include "timer_sw/timer_sw.h"

int main()
{
  const int res = COMP_C_add(1, 2);
  (void) res;

  TimerSw_t timer;
  TimerSw_Init(&timer, nullptr, nullptr);
  TimerSw_Tick(&timer, 10U);

  app_id_t app_id = "TEST";
  DLT_RegisterApp(app_id, "Test application");

  dlt_context_t dlt_context;
  ctx_id_t ctx_id = "CTX1";
  DLT_RegisterContext(&dlt_context, app_id, ctx_id, "Test context");

  DLT_Log(&dlt_context, DLT_LOG_INFO, 0, "Hello world", 0);

  return 0;
}
