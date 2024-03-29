program test_get_current_time

  use bmif_1_2, only: BMI_FAILURE
  use bmigiplf
  use fixtures, only: config_file, status

  implicit none

  double precision, parameter :: expected_time = 1.d0

  type (bmi_gipl) :: m
  double precision :: current_time

  status = m%initialize(config_file)
  status = m%get_current_time(current_time)
  status = m%finalize()

  if (current_time .ne. expected_time) then
     stop BMI_FAILURE
  end if
end program test_get_current_time
