if(DEFINED ENV{LLVM_ADIN_PATH})
  set(LLVM_ADIN_PATH $ENV{LLVM_ADIN_PATH})
else()
  message(FATAL_ERROR "Not set LLVM_ADIN_PATH env var")
endif()

find_program(RESULT_FIND_OPT
  NAME opt
  PATHS ${LLVM_ADIN_PATH}
  NO_DEFAULT_PATH
  REQUIRED
)

include(CMakePrintHelpers)
cmake_print_variables(RESULT_FIND_OPT)

if(NOT RESULT_FIND_OPT)
    message(FATAL_ERROR "opt binary not found at LLVM_ADIN_PATH path: ${LLVM_ADIN_PATH}")
endif()

add_custom_command(
  OUTPUT opt_file_find
  COMMAND ${RESULT_FIND_OPT} --version
  USES_TERMINAL
  DEPENDS RESULT_FIND_OPT
)

execute_process(
  COMMAND ${RESULT_FIND_OPT} --version
  OUTPUT_VARIABLE LLVM_OPT_VERSION
  RESULT_VARIABLE LLVM_OPT_RESULT
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

if(NOT LLVM_OPT_RESULT EQUAL 0)
  message(FATAL_ERROR "Failed to get opt version")
endif()

cmake_print_variables(LLVM_OPT_VERSION)

execute_process(
  COMMAND clang --version
  OUTPUT_VARIABLE CLANG_VERSION
  RESULT_VARIABLE CLANG_RESULT
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

if(NOT CLANG_RESULT EQUAL 0)
  message(FATAL_ERROR "Failed to get clang version")
endif()

cmake_print_variables(CLANG_VERSION)

set(REMCU_VM_PATH ${CMAKE_CURRENT_LIST_DIR}/../)
