
#include "dlt/dlt_client.h"

int main()
{
  app_id_t app_id = "TEST";
  DLT_RegisterApp(app_id, "Test application");

  dlt_context_t dlt_context;
  ctx_id_t ctx_id = "CTX1";
  DLT_RegisterContext(&dlt_context, app_id, ctx_id, "Test context");

  DLT_Log(&dlt_context, DLT_LOG_INFO, 0, "Hello world", 0);
}
