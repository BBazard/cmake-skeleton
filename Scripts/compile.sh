#!/usr/bin/env bash

cd CMake 2> /dev/null ||
cd ../CMake 2> /dev/null
mkdir build 2> /dev/null
cd build
cmake ..
make
cd ..
