cmake_minimum_required(VERSION 3.15)
project(hilldwarf CXX)




add_library(hilldwarf src/hilldwarf.cpp)
target_include_directories(hilldwarf PUBLIC include)



set_target_properties(hilldwarf PROPERTIES PUBLIC_HEADER "include/hilldwarf.h")
install(TARGETS hilldwarf)
