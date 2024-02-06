/**
 * \file timer.c
 * \brief Timer
 * \author Nicolas Boutin
 * \date 2023-02
 */

#include "dlt_client.h"

void DLT_RegisterApp(const app_id_t name, const char* desc) {}

void DLT_RegisterContext(dlt_context_t* dlt_context,
                         const app_id_t app_id,
                         const ctx_id_t ctx_id,
                         const char* desc)
{}

void DLT_Log(dlt_context_t* dlt_context,
             log_level_t log_level,
             uint8_t msg_id,
             const char* string,
             uint32_t arg1)
{}
