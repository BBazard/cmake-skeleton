#!/usr/bin/env bash

# fail if not in git project
git rev-parse || exit 1

# set toplevel directory
TOP_LEVEL_DIRECTORY="$(git rev-parse --show-toplevel)" 

cmake -E remove_directory "${TOP_LEVEL_DIRECTORY}/bin"
cmake -E remove_directory "${TOP_LEVEL_DIRECTORY}/Docs/html"
cmake -E remove_directory "${TOP_LEVEL_DIRECTORY}/Docs/latex"
cmake -E remove "${TOP_LEVEL_DIRECTORY}/Docs/Doxyfile"
cmake -E remove_directory "${TOP_LEVEL_DIRECTORY}/CMake/build"

