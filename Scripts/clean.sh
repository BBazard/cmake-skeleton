#!/usr/bin/env bash

# fail if not in git project
git rev-parse || exit 1

# set toplevel directory
TOPLEVELDIRECTORY="$(git rev-parse --show-toplevel)" 

cd "$TOPLEVELDIRECTORY"

# clean
cmake -E remove_directory Docs/html
cmake -E remove_directory Docs/latex 
cmake -E remove_directory CMake/build
cmake -E remove_directory bin
cmake -E remove Docs/Doxyfile
