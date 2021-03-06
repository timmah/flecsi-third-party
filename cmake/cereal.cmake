set(CEREAL_NAME cereal)

ExternalProject_Add(${CEREAL_NAME}
 DEPENDS ${GASNET_NAME}
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/cereal
 CONFIGURE_COMMAND ${CMAKE_COMMAND}
   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
   -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
   -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
   -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
   -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
   -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
   -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
	-DSKIP_PORTABILITY_TEST:BOOL=ON
	-DJUST_INSTALL_CEREAL:BOOL=ON
   <SOURCE_DIR>
 LOG_BUILD 1
)
