#!/usr/bin/env bash

# fail if not in git project
git rev-parse || exit 1

# set toplevel directory
TOPLEVELDIRECTORY="$(git rev-parse --show-toplevel)" 

cd "$TOPLEVELDIRECTORY"/CMake

# clean cache
cmake -E remove_directory build
cmake -E make_directory build
cd build

# compilation
cmake ..
make

# change directory to bin
cd "$TOPLEVELDIRECTORY"/bin

# run tests
./runTests

