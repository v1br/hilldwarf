#include "hilldwarf.h"
#include <vector>
#include <string>

int main() {
    hilldwarf();

    std::vector<std::string> vec;
    vec.push_back("test_package");

    hilldwarf_print_vector(vec);
}
