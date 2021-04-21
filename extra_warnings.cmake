#
# A set of compilation flags on top of what esp-idf sets. These are more stict.
#
list(APPEND EXTRA_C_FLAGS_LIST
    # Note: See default flags in toolchain/esp-idf/CMakeLists.txt
    #
    # You can also do a verbose build (-v) to see the full compile command:
    #    idf.py -v build

    # Re-enable warnings that are configured off in esp-idf
    -Werror
    -Wunused-function
    -Wunused-but-set-variable
    -Wunused-variable
    -Wdeprecated-declarations
    -Wunused-parameter
    -Wsign-compare
    -Wold-style-declaration

    # Stop on first error
    -Wfatal-errors

    # Misc. other flags
    # Used these links for insipiration:
    # https://stackoverflow.com/a/3376483
    # https://interrupt.memfault.com/best-and-worst-gcc-clang-compiler-flags
    -fno-common
    -fstack-usage
    -Wstack-usage=1024
    -Wfloat-equal
    -Wundef
    -Wshadow
    -Wpointer-arith
    -Wcast-align
    -Wstrict-prototypes
    -Wwrite-strings
    -Waggregate-return
    -Wcast-qual
    -Wswitch-default
    -Wswitch-enum
    -Wconversion
    -Wsign-conversion
    -Wunreachable-code
    -Wformat=2
    -Winit-self
    -Wformat-truncation
)
component_compile_options(${EXTRA_C_FLAGS_LIST})
