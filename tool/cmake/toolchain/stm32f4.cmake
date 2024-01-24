# https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html

set(cpu cortex-m4)
set(float-abi hard)
set(fpu fpv4-sp-d16)

set(ASM_FLAGS -x assembler-with-cpp)
add_compile_options(
  -mcpu=${cpu}
  -mthumb
  -mtune=${cpu}
  -mfpu=${fpu}
  -mfloat-abi=${float-abi}
  "$<$<COMPILE_LANGUAGE:ASM>:${ASM_FLAGS}>")

add_link_options(
  -mcpu=${cpu}
  -mthumb
  -mfpu=${fpu}
  -mfloat-abi=${float-abi}
  --specs=nosys.specs
  --specs=nano.specs # newlib-nano
)
