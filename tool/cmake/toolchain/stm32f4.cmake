# Do not use with Conan packages manager, replace with Conan profile.
# https://gcc.gnu.org/onlinedocs/gcc/ARM-Options.html

set(cpu cortex-m4)
set(float-abi hard)
set(fpu fpv4-sp-d16)

set(ASM_FLAGS -x assembler-with-cpp)

set(compile_link_options
    -mcpu=${cpu}
    -mthumb
    -mtune=${cpu}
    -mfpu=${fpu}
    -mfloat-abi=${float-abi})

add_compile_options(${compile_link_options} "$<$<COMPILE_LANGUAGE:ASM>:${ASM_FLAGS}>")

add_link_options(${compile_link_options} --specs=nosys.specs --specs=nano.specs # newlib-nano
)
