program test_initialize

  use bmif_1_2, only: BMI_FAILURE
  use bmigiplf
  use fixtures, only: status, config_file

  implicit none

  type (bmi_gipl) :: m
  integer :: status1, status2, s
  real*8 :: end_time

  status1 = m%initialize(config_file)
  status = m%finalize()
    
  if (status1 .ne. 0) then
     stop BMI_FAILURE
  end if

end program test_initialize
