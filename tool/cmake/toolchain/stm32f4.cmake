set(cpu cortex-m4)
set(fpu fpv4-sp-d16)
set(float-abi hard)

set(ASM_FLAGS -x assembler-with-cpp)
add_compile_options(
  -mcpu=${cpu} -mthumb # mcu
  -mfpu=${fpu} -mfloat-abi=${float-abi} # fpu
  "$<$<COMPILE_LANGUAGE:ASM>:${ASM_FLAGS}>"
)

add_link_options(
  -mcpu=${cpu} -mthumb # mcu
  -mfpu=${fpu} -mfloat-abi=${float-abi} # fpu
  --specs=nosys.specs --specs=nano.specs # newlib-nano
)
