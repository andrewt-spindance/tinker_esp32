cmake_minimum_required(VERSION 3.5)

# Turn on pretty colors in build output
add_compile_options(-fdiagnostics-color=always)

include($ENV{IDF_PATH}/tools/cmake/project.cmake)

project("hello_world")
