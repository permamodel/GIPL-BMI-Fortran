program test_set_value

  use bmif_1_2, only: BMI_SUCCESS, BMI_FAILURE
  use bmigiplf
  use fixtures, only: status, print_array, config_file

  implicit none

  !character (len=256), parameter :: config_file = "test.cfg"
  type (bmi_gipl) :: m
  integer :: retcode

  retcode = test1()
  if (retcode.ne.BMI_SUCCESS) then
     stop BMI_FAILURE
  end if

contains

  function test1() result(code)
    character (len=*), parameter :: &
         var_name = "land_surface_air__temperature"
    integer, parameter :: size = 1
    real :: x(size), y(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, x)
    status = m%set_value(var_name, [3.0])
    status = m%get_value(var_name, y)
    status = m%finalize()

    ! Visual inspection.
    write(*,*) "Test 1"
    
    print *, x, y

    code = BMI_SUCCESS
    do i = 1, size
       if (y(i).ne.3.0) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test1

  function test2() result(code)
    character (len=*), parameter :: &
         var_name = "snowpack__depth"
    integer, parameter :: size = 1
    real :: x(size), y(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, x)
    status = m%set_value(var_name, [3.0])
    status = m%get_value(var_name, y)
    status = m%finalize()

    ! Visual inspection.
    write(*,*) "Test 2"
    
    print *, x, y

    code = BMI_SUCCESS
    do i = 1, size
       if (y(i).ne.3.0) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test2

  function test3() result(code)
    character (len=*), parameter :: &
         var_name = "snow__thermal_conductivity"
    integer, parameter :: size = 1
    real :: x(size), y(size)
    integer :: i, code

    status = m%initialize(config_file)
    status = m%get_value(var_name, x)
    status = m%set_value(var_name, [3.0])
    status = m%get_value(var_name, y)
    status = m%finalize()

    ! Visual inspection.
    write(*,*) "Test 3"
    
    print *, x, y

    code = BMI_SUCCESS
    do i = 1, size
       if (y(i).ne.3.0) then
          code = BMI_FAILURE
          exit
       end if
    end do
  end function test3

end program test_set_value
