# For Cygwin legacy 2.8.4
cmake_minimum_required (VERSION 2.8.4)

# Project Name
project ("skeleton")

# Compiler option
if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    set(warnings "-Wall -Wextra -Werror -g")
endif()

# variables declaration
set (TOP_LEVEL_DIRECTORY "${PROJECT_SOURCE_DIR}/..")
set (CMAKE_RUNTIME_OUTPUT_DIRECTORY ${TOP_LEVEL_DIRECTORY}/bin)

set (EXECUTABLE_NAME "program")
set (TESTS_EXECUTABLE_NAME "runTests")

########################################
# MakePart
########################################
# Project part
set (SOURCE_DIRECTORY "${TOP_LEVEL_DIRECTORY}/Project/src")
set (HEADER_DIRECTORY "${TOP_LEVEL_DIRECTORY}/Project/include")

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

add_executable (
  ${EXECUTABLE_NAME} 
  ${PROJECT_SOURCE_FILES}
  ${PROJECT_HEADER_FILES}
  )

# Testing part
add_executable (
  ${TESTS_EXECUTABLE_NAME} 
  ${TOP_LEVEL_DIRECTORY}/Testing/tests.cpp
  )
########################################
# SFML Part     
########################################
set(CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/modules" ${CMAKE_MODULE_PATH})

find_package(
  SFML 2.2 # necessary for "FindSFML.cmake"
  REQUIRED system window graphics network audio
  )

target_link_libraries(${EXECUTABLE_NAME} ${SFML_LIBRARIES})
########################################
# Gtest 
########################################
# Locate GTest
find_package (GTest REQUIRED)
include_directories (${GTEST_INCLUDE_DIRS})
 
# Link TESTS_EXECUTABLE with what we want to test and the GTest and pthread library
target_link_libraries (
  ${TESTS_EXECUTABLE_NAME} 
  ${GTEST_LIBRARIES} 
  pthread
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

