#!/usr/bin/env bash

# fail if not in git project
git rev-parse || exit 1

# set top level directory
TOP_LEVEL_DIRECTORY="$(git rev-parse --show-toplevel)" 

# make or mingw32-make ?
make -C "${TOP_LEVEL_DIRECTORY}/CMake/build"

# run tests
"${TOP_LEVEL_DIRECTORY}/bin/runTests"

