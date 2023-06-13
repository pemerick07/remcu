
if(NOT DEFINED LICENSE_TYPE)
	if(NOT DEFINED ENV{LICENSE_TYPE})
		message(FATAL_ERROR "******* $LICENSE_TYPE is not defined! ********")
	else()
		set(LICENSE_TYPE $ENV{LICENSE_TYPE})
	endif()
endif()


if(NOT DEFINED LICENSE_FILE_PATH)
	if(NOT DEFINED ENV{LICENSE_FILE_PATH})
		set(LICENSE_FILE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/LICENSE.txt)
	else()
		set(LICENSE_FILE_PATH $ENV{LICENSE_FILE_PATH})
	endif()
endif()
