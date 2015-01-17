set (cmake_generated
  "${TOP_LEVEL_DIRECTORY}/bin"
  "${TOP_LEVEL_DIRECTORY}/Docs/html"
  "${TOP_LEVEL_DIRECTORY}/Docs/latex"
  #"${TOP_LEVEL_DIRECTORY}/CMake/build"
)

message("lol ${TOP_LEVEL_DIRECTORY}")

foreach(file "${cmake_generated}")

  if (EXISTS "${file}")
    message("lol ${file}")
     file(REMOVE_RECURSE "${file}")
  endif()

endforeach(file)

