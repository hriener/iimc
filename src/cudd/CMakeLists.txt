set(CUDD_OBJ_SOURCES
  cuddObj.cc)
add_library(cudd_obj_static STATIC ${CUDD_OBJ_SOURCES})

set(CUDD_EPD_SOURCES
  epd.c)
add_library(cudd_epd_static STATIC ${CUDD_EPD_SOURCES})

set(CUDD_MTR_SOURCES
  mtrBasic.c
  mtrGroup.c)
add_library(cudd_mtr_static STATIC ${CUDD_MTR_SOURCES})

set(CUDD_ST_SOURCES
  st.c)
add_library(cudd_st_static STATIC ${CUDD_ST_SOURCES})

set(CUDD_UTIL_SOURCES
  cpu_stats.c
  cpu_time.c
  datalimit.c
  prtime.c
  safe_mem.c
  qsort.c
  cstringstream.c)
add_library(cudd_util_static STATIC ${CUDD_UTIL_SOURCES})

set(CUDD_SOURCES
  cuddAPI.c
  cuddAddAbs.c
  cuddAddApply.c
  cuddAddFind.c
  cuddAddIte.c
  cuddAddInv.c
  cuddAddNeg.c
  cuddAddWalsh.c
  cuddAndAbs.c 
  cuddAnneal.c
  cuddApa.c
  cuddApprox.c
  cuddBddAbs.c
  cuddBddCorr.c
  cuddBddIte.c
  cuddBridge.c
  cuddCache.c
  cuddCheck.c
  cuddClip.c
  cuddCof.c
  cuddCompose.c
  cuddDecomp.c
  cuddEssent.c
  cuddExact.c
  cuddExport.c
  cuddGenCof.c
  cuddGenetic.c
  cuddGroup.c
  cuddHarwell.c
  cuddInit.c
  cuddInteract.c
  cuddLCache.c
  cuddLevelQ.c
  cuddLinear.c
  cuddLiteral.c
  cuddMatMult.c
  cuddPriority.c
  cuddRead.c
  cuddRef.c
  cuddReorder.c
  cuddSat.c
  cuddSign.c
  cuddSolve.c
  cuddSplit.c
  cuddSubsetHB.c
  cuddSubsetSP.c
  cuddSymmetry.c
  cuddTable.c
  cuddUtil.c
  cuddWindow.c
  cuddZddCount.c
  cuddZddFuncs.c
  cuddZddGroup.c
  cuddZddIsop.c
  cuddZddLin.c
  cuddZddMisc.c
  cuddZddPort.c
  cuddZddReord.c
  cuddZddSetop.c
  cuddZddSymm.c
  cuddZddUtil.c)
add_library(cudd_static STATIC ${CUDD_SOURCES})

set(CUDD_LIBS
  cudd_obj_static
  cudd_static
  cudd_epd_static
  cudd_mtr_static
  cudd_st_static
  cudd_util_static
  PARENT_SCOPE)
