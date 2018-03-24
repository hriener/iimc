cmake_minimum_required(VERSION 3.1)
project(iimc LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(BISON "/usr/local/opt/bison/bin/bison")

# some specific compiler definitions
include(CheckCXXCompilerFlag)
check_cxx_compiler_flag("-fcolor-diagnostics" HAS_FCOLOR_DIAGNOSTICS)
if (HAS_FCOLOR_DIAGNOSTICS)
  add_definitions(-fcolor-diagnostics)
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DHAVE_CONFIG_H -D__STDC_LIMIT_MACROS -D__STDC_FORMAT_MACROS  -std=c++11 -Wall -Wextra -stdlib=libc++ -g -O3")

add_subdirectory(src/sat)
add_subdirectory(src/cudd)

set(IIMC_INCLUDE_DIRS
  ${CMAKE_SOURCE_DIR}
  ${CMAKE_SOURCE_DIR}/src/util
  ${CMAKE_SOURCE_DIR}/src/expressions
  ${CMAKE_SOURCE_DIR}/src/sim
  ${CMAKE_SOURCE_DIR}/src/parser
  ${CMAKE_SOURCE_DIR}/src/model
  ${CMAKE_SOURCE_DIR}/src/sat
  ${CMAKE_SOURCE_DIR}/src/opt
  ${CMAKE_SOURCE_DIR}/src/copt
  ${CMAKE_SOURCE_DIR}/src/sopt
  ${CMAKE_SOURCE_DIR}/src/truthtable
  ${CMAKE_SOURCE_DIR}/src/cnf
  ${CMAKE_SOURCE_DIR}/src/properties
  ${CMAKE_SOURCE_DIR}/src/automata
  ${CMAKE_SOURCE_DIR}/src/mc
  ${CMAKE_SOURCE_DIR}/src/main
  ${CMAKE_SOURCE_DIR}/src/cudd)

include_directories(${IIMC_INCLUDE_DIRS})

# /usr/local/opt/bison/bin/bison -y -o src/properties/PropCtlParser.cc ./src/properties/PropCtlParser.yy
add_custom_command(OUTPUT ${CMAKE_SOURCE_DIR}/src/properties/PropCtlParser.cc
  COMMAND ${BISON} -y -o src/properties/PropCtlParser.cc ./src/properties/PropCtlParser.yy
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  VERBATIM)

# /bin/sh ./build-aux/ylwrap src/properties/PropCtlScanner.ll lex.yy.c src/properties/PropCtlScanner.cc -- flex -olex.yy.c -olex.yy.c 
add_custom_command(OUTPUT ${CMAKE_SOURCE_DIR}/src/properties/PropCtlScanner.cc
  COMMAND /bin/sh ./build-aux/ylwrap src/properties/PropCtlScanner.ll lex.yy.c src/properties/PropCtlScanner.cc -- flex -olex.yy.c -olex.yy.c
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  VERBATIM)

# /usr/local/opt/bison/bin/bison -y --name-prefix=autoparser -o src/automata/AutoParser.cc ./src/automata/AutoParser.yy
add_custom_command(OUTPUT ${CMAKE_SOURCE_DIR}/src/automata/AutoParser.cc
  COMMAND ${BISON} -y --name-prefix=autoparser -o src/automata/AutoParser.cc ./src/automata/AutoParser.yy
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  VERBATIM)

# /bin/sh ./build-aux/ylwrap src/automata/AutoScanner.ll lex.yy.c src/automata/AutoScanner.cc -- flex -olex.yy.c -olex.yy.c 
add_custom_command(OUTPUT ${CMAKE_SOURCE_DIR}/src/automata/AutoScanner.cc
  COMMAND /bin/sh ./build-aux/ylwrap src/automata/AutoScanner.ll lex.yy.c src/automata/AutoScanner.cc -- flex -olex.yy.c -olex.yy.c
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  VERBATIM)

add_definitions(-DHAVE_CONFIG_H)

set(IIMC_SOURCES
  src/util/UtilSystem.cpp
  src/util/Random.cpp
  src/expressions/Expr.cpp
  src/expressions/ExprUtil.cpp
  src/expressions/ExprBdd.cpp
  src/expressions/ExprVerilog.cpp
  src/expressions/ExprAttachment.cpp
  src/model/Model.cpp
  src/sim/Sim.cpp
  src/sim/ThreeValuedSimulation.cpp
  src/parser/AIGER.cpp
  src/parser/DIMACS.cpp
  src/parser/aiger19.c
  src/sat/SAT.cpp
  src/sat/SAT_minisat.cpp
  src/sat/SAT_zchaff.cpp
  src/opt/BddAttachment.cpp
  src/opt/BddTrAttachment.cpp
  src/copt/SATSweep.cpp
  src/copt/CombAttachment.cpp
  src/copt/AIGUtil.cpp
  src/copt/AIG.cpp
  src/copt/AIGAttachment.cpp
  src/copt/CutSweep.cpp
  src/sopt/SeqAttachment.cpp
  src/sopt/SequentialEquivalence.cpp
  src/sopt/StuckAt.cpp
  src/sopt/Simplifier.cpp
  src/sopt/PhaseAbstraction.cpp
  src/sopt/AbsInt.cpp
  src/sopt/Slice.cpp
  src/sopt/Decode.cpp
  src/truthtable/TreeTruthTable.cpp
  src/truthtable/BitTruthTable.cpp
  src/cnf/TechMapCNF.cpp
  src/cnf/CNFAttachment.cpp
  src/cnf/DIMACSAction.cpp
  src/cnf/NiceDAG.cpp
  src/cnf/Cover.cpp
  src/cnf/SimplifyCNF.cpp
  src/cnf/StringTR.cpp
  src/properties/PropCtlScanner.cc
  src/properties/PropCtlParser.cc
  src/properties/PropCtlDriver.cpp  
  src/automata/AutoScanner.cc
  src/automata/AutoParser.cc
  src/automata/AutoDriver.cpp
  src/mc/BMC.cpp
  src/mc/COI.cpp
  src/mc/IC3.cpp
  src/mc/BddReach.cpp
  src/mc/TacticMisc.cpp
  src/mc/ProofAttachment.cpp
  src/mc/RchAttachment.cpp
  src/mc/Fair.cpp
  src/mc/IICTL.cpp
  src/mc/FCBMC.cpp
  src/mc/IIC.cpp
  src/mc/BddGSH.cpp
  src/mc/Persist.cpp
  src/mc/KLive.cpp
  src/main/options.cpp
  src/main/main.cpp
  src/main/Dispatch.cpp
  src/main/Engine.cpp)

find_package(Boost COMPONENTS system program_options regex thread REQUIRED)
include_directories(${Boost_INCLUDE_DIRS})

add_executable(iimc ${IIMC_SOURCES})
target_link_libraries(iimc ${Boost_LIBRARIES} ${CUDD_LIBS} ${SAT_LIBS})
