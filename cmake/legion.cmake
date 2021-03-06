set(LEGION_NAME legion)

if(ENABLE_GASNET)
  set(GASNet_ROOT_DIR ${CMAKE_INSTALL_PREFIX})
endif()

ExternalProject_Add(${LEGION_NAME}
 DEPENDS ${GASNET_NAME}
 SOURCE_DIR ${PROJECT_SOURCE_DIR}/legion
 CONFIGURE_COMMAND ${CMAKE_COMMAND}
   -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
   -DCMAKE_CXX_COMPILER:FILEPATH=${CMAKE_CXX_COMPILER}
   -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
   -DCMAKE_C_COMPILER:FILEPATH=${CMAKE_C_COMPILER}
   -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
   -DCMAKE_SHARED_LINKER_FLAGS:STRING=${CMAKE_SHARED_LINKER_FLAGS}
   -DBUILD_SHARED_LIBS:BOOL=${BUILD_SHARED_LIBS}
   -DCMAKE_INSTALL_PREFIX:PATH=${CMAKE_INSTALL_PREFIX}
   -DGASNet_CONDUIT:STRING=${GASNet_CONDUIT}
   -DGASNet_ROOT_DIR:STRING=${GASNet_ROOT_DIR}
   -DLegion_USE_GASNet=ON
   -DLegion_BUILD_EXAMPLES=ON
   <SOURCE_DIR>
   LOG_BUILD 1
)
