message("Making build directory: ${CMAKE_CURRENT_SOURCE_DIR}/msvc/build")
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/msvc)
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/msvc/build)
message("Generating project files...")
execute_process(COMMAND ${CMAKE_COMMAND} ${CMAKE_CURRENT_SOURCE_DIR} -G "Garbage" -T v141 -A Win32
  WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/msvc/build
  RESULT_VARIABLE success
)
if (NOT ${success} MATCHES "0")
  message(SEND_ERROR "Generation step failed.")
  return()
endif()