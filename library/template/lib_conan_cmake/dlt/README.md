# Template library Conan with CMake

Links:

- [Tutorial](https://docs.conan.io/2/tutorial)
- [Reference](https://docs.conan.io/2/reference/conanfile/methods.html#reference-conanfile-methods)

## Create Conan package

```console
conan create .
conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc
conan create . -c tools.cmake.cmaketoolchain:generator=Ninja -pr:h gcc -s build_type=MinSizeRel
conan create . -pr stm32f
```

## Check Conan local cache

```console
conan list dlt/*:*
```
