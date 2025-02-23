#pragma once

#include <vector>
#include <string>


#ifdef _WIN32
  #define HILLDWARF_EXPORT __declspec(dllexport)
#else
  #define HILLDWARF_EXPORT
#endif

HILLDWARF_EXPORT void hilldwarf();
HILLDWARF_EXPORT void hilldwarf_print_vector(const std::vector<std::string> &strings);
