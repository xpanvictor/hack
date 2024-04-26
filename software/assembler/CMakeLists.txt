cmake_minimum_required(VERSION 3.27)
project(assembler)

set(CMAKE_CXX_STANDARD 14)

include_directories(c++)

add_executable(assembler
        c++/assembler.cpp
        c++/code.cpp
        c++/code.h
        c++/parser.cpp
        c++/parser.h)
