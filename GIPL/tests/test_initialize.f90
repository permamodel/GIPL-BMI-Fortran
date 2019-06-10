program test_initialize

  use bmif_1_2, only: BMI_SUCCESS
  use bmigiplf
  use fixtures, only: status

  implicit none

  character (len=*), parameter :: config_file1 = "test.cfg"

  type (bmi_gipl) :: m
  integer :: status1, status2, s
  real*8 :: end_time

  status1 = m%initialize(config_file1)
  s = m%get_end_time(end_time)
  status = m%finalize()
  if (status1.ne.BMI_SUCCESS) then
     stop 1
  end if

end program test_initialize