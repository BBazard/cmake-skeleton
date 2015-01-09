#!/usr/bin/env bash

cd Scripts 2> /dev/null ||
cd ../Scripts 2> /dev/null
rm -rf ../Docs/html ../Docs/latex ../Docs/Doxyfile ../CMake/build 
rm -rf ../CMake/build
rm -rf ../bin
