##### MINISAT20 #####
set(MINISAT20_SOURCES
  minisat20/mcore/Solver.C
  minisat20/simp/SimpSolver.C)

set(MINISAT20_INCLUDE_PATHS
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/minisat20/mtl)

add_library(minisat20_static STATIC ${MINISAT20_SOURCES})
target_include_directories(minisat20_static PUBLIC ${MINISAT20_INCLUDE_PATHS})

##### MINISAT #####
set(MINISAT_SOURCES
  minisat/mcore/Solver.cc
  minisat/utils/System.cc
  minisat/simp/SimpSolver.cc
  ${CMAKE_CURRENT_SOURCE_DIR}/../util/Random.cpp)

set(MINISAT_INCLUDE_PATHS
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_SOURCE_DIR}/minisat/mtl)

add_library(minisat_static STATIC ${MINISAT_SOURCES})
target_include_directories(minisat_static PUBLIC ${MINISAT_INCLUDE_PATHS})
target_compile_options(minisat_static PRIVATE "-Wno-reserved-user-defined-literal")

##### ZCHAFF #####
set(ZCHAFF_SOURCES
  zchaff/zchaff_utils.cpp
  zchaff/zchaff_solver.cpp
  zchaff/zchaff_base.cpp
  zchaff/zchaff_dbase.cpp
  zchaff/zchaff_cpp_wrapper.cpp)

set(ZCHAFF_INCLUDE_PATHS
  ${CMAKE_CURRENT_SOURCE_DIR}/zchaff)

add_library(zchaff_static STATIC ${ZCHAFF_SOURCES})
target_include_directories(zchaff_static PUBLIC ${ZCHAFF_INCLUDE_PATHS})

set(SAT_LIBS
  minisat20_static
  minisat_static
  zchaff_static
  PARENT_SCOPE)
