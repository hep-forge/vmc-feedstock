#!/bin/bash
set -eo pipefail

# Build with the C++ standard ROOT was built with.
CXXSTD=$(root-config --cflags | grep -o 'std=c++[0-9a-z]*' | sed 's/std=c++//')

cmake ${CMAKE_ARGS} -S "${SRC_DIR}" -B build \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_STANDARD="${CXXSTD}"
cmake --build build --parallel "${CPU_COUNT}" --target install
