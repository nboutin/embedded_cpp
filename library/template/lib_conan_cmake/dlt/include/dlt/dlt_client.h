
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

#include <stdint.h>

// --- Public types

typedef char app_id_t[5];
typedef char ctx_id_t[5];
typedef uint8_t log_level_t;

typedef struct {
  ctx_id_t ctx_id;       /*!< context id name */
  uint8_t msg_counter;   /*!< message counter */
  log_level_t log_level; /*!< log level */
} __attribute__((packed)) dlt_context_t;

#define DLT_LOG_INFO ((log_level_t) 6U)

// --- Public functions

void DLT_RegisterApp(const app_id_t name, const char* desc);

void DLT_RegisterContext(dlt_context_t* dlt_context,
                         const app_id_t app_id,
                         const ctx_id_t ctx_id,
                         const char* desc);

void DLT_Log(dlt_context_t* dlt_context,
             log_level_t log_level,
             uint8_t msg_id,
             const char* string,
             uint32_t arg1);

#ifdef __cplusplus
}
#endif
