program test_get_value

  use bmif_1_2, only: BMI_SUCCESS, BMI_FAILURE
  use bmigiplf
  use fixtures, only: status, print_array, config_file

  implicit none

  type (bmi_gipl) :: m
  integer :: retcode

  retcode = test1()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if
  
  retcode = test2()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

  retcode = test3()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if
  
contains

  ! Test getting plate_surface__temperature.
  function test1() result(code)
    character (len=*), parameter :: &
         var_name = "land_surface_air__temperature"
    integer, parameter :: size = 1
    real, parameter :: expected = 2.861
    real :: tval(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, tval)
    status = m%finalize()
    
    print *, abs(tval(1) - expected)

    ! Visual inspection.
    write(*,*) "Test 1"

    code = BMI_SUCCESS
    do i = 1, size
       if (abs(tval(i) - expected) .gt. 1E-5) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test1

  ! Test getting precipitation.
  function test2() result(code)
    character (len=*), parameter :: &
         var_name = "snowpack__depth"
    integer, parameter :: size = 1
    real, parameter :: expected = 0
    real :: tval(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, tval)
    status = m%finalize()
    
    print *, abs(tval(1) - expected)

    ! Visual inspection.
    write(*,*) "Test 2"

    code = BMI_SUCCESS
    do i = 1, size
       if (abs(tval(i) - expected) .gt. 1E-5) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test2

  ! Test getting snow depth.
  function test3() result(code)
    character (len=*), parameter :: &
         var_name = "snow__thermal_conductivity"
    integer, parameter :: size = 1
    real, parameter :: expected = 0.1
    real :: tval(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, tval)
    status = m%finalize()
    
    print *, abs(tval(1) - expected)

    ! Visual inspection.
    write(*,*) "Test 3"

    code = BMI_SUCCESS
    do i = 1, size
       if (abs(tval(i) - expected) .gt. 1E-5) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test3

end program test_get_value
