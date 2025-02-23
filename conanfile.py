from conan import ConanFile
from conan.tools.cmake import CMakeToolchain, CMake, cmake_layout, CMakeDeps
from conan.tools.files import get

class hilldwarfRecipe(ConanFile):
    name = "hilldwarf"
    version = "0.1"
    package_type = "library"

    # Optional metadata
    license = "MIT License"
    author = "v1br vibhorag2003@gmail.com"
    url = "https://github.com/v1br/hilldwarf"
    description = "hilldwarf is a cpp package, available through conan, for generating random noise"
    topics = ("noise", "terrain", "random noise")

    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"
    options = {"shared": [True, False], "fPIC": [True, False]}
    default_options = {"shared": False, "fPIC": True}

    def source(self):
        get(self, **self.conan_data["sources"][self.version])

    def config_options(self):
        if self.settings.os == "Windows":
            self.options.rm_safe("fPIC")

    def configure(self):
        if self.options.shared:
            self.options.rm_safe("fPIC")

    def layout(self):
        cmake_layout(self)
    
    def generate(self):
        deps = CMakeDeps(self)  # used when package has its own dependencies
        deps.generate()
        tc = CMakeToolchain(self) # convert recipe settings & options to cmake syntax
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()

    def package_info(self):
        self.cpp_info.libs = ["hilldwarf"]

