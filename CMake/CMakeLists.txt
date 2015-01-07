# For Cygwin legacy 2.8.4
cmake_minimum_required (VERSION 2.8.4)

# Project Name
project ("moon")

# option for compiler by default ...

set (EXECUTABLE_NAME "myproject")

set (TOP_LEVEL_DIRECTORY "${PROJECT_SOURCE_DIR}/..")

########################################
# MakePart
########################################
set (SOURCE_DIRECTORY "${TOP_LEVEL_DIRECTORY}/Main/src")
set (HEADER_DIRECTORY "${TOP_LEVEL_DIRECTORY}/Main/src")

file (
  GLOB_RECURSE
  PROJECT_SOURCE_FILES
  "${SOURCE_DIRECTORY}/*.cpp"
  )

file (
  GLOB_RECURSE
  PROJECT_HEADER_FILES
  "${HEADER_DIRECTORY}/*.hpp"
  )

# Create executable
add_executable (
  ${EXECUTABLE_NAME} 
  ${PROJECT_SOURCE_FILES}
  ${PROJECT_HEADER_FILES}
  )
########################################
# Doc Part     
########################################
find_package (Doxygen REQUIRED)

set (DOC_PATH "${TOP_LEVEL_DIRECTORY}/Docs")

configure_file (
  "${DOC_PATH}/Doxyfile.in"
  "${DOC_PATH}/Doxyfile"
  )

# Run Doxygen
add_custom_target (
  Docs
  ALL # Run every time
  COMMAND ${DOXYGEN_EXECUTABLE} ${DOC_PATH}/Doxyfile
  )
########################################
# Useless
########################################
configure_file (
  "${TOP_LEVEL_DIRECTORY}/CMake/CMakeLists.txt"
  "${TOP_LEVEL_DIRECTORY}/CMake/build/Check.out"
  )
