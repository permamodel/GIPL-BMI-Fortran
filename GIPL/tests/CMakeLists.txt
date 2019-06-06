include(CTest)

include_directories(${CMAKE_Fortran_MODULE_DIRECTORY})

function(make_test test_name)
  add_test(NAME ${test_name} COMMAND ${test_name})
  set(src_${test_name} ${test_name}.f90 fixtures.f90)
  add_executable(${test_name} ${src_${test_name}})
  target_link_libraries(${test_name} ${bmi_lib} ${bmigipl_lib})
endfunction(make_test)