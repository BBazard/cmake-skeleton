#!/usr/bin/env bash

# fail if not in git project
git rev-parse || exit 1

# set top level directory
TOP_LEVEL_DIRECTORY="$(git rev-parse --show-toplevel)" 

# clean cache
cmake -E remove_directory "${TOP_LEVEL_DIRECTORY}/CMake/build"
cmake -E make_directory "${TOP_LEVEL_DIRECTORY}/CMake/build"

# configuration
cmake -B"${TOP_LEVEL_DIRECTORY}/CMake/build" -H"${TOP_LEVEL_DIRECTORY}/CMake"

