from conan import ConanFile
from conan.tools.cmake import cmake_layout, CMake

# compiler requirements will be added by choice of profile


class app_conan_cmake(ConanFile):
    settings = "compiler", "build_type", "os", "arch"
    generators = "CMakeToolchain", "CMakeDeps", "VirtualBuildEnv"

    def build_requirements(self):
        pass

    def requirements(self):
        self.requires("dlt/[~0.1]")
        self.requires("timer_sw/[~0.1]")

    def layout(self):
        cmake_layout(self)

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
