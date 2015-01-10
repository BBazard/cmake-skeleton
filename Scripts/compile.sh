#!/usr/bin/env bash

cd CMake 2> /dev/null ||
cd ../CMake 2> /dev/null

# clean cache
rm -rf build
mkdir build

cd build
cmake ..
make
./../../bin/runTests
cd ..
