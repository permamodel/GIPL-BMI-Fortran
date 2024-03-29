program test_get_grid_size

  use bmif_1_2, only: BMI_FAILURE
  use bmigiplf
  use fixtures, only: config_file, status

  implicit none

  integer, parameter :: grid_id = 1
  integer, parameter :: expected_size = 1

  type (bmi_gipl) :: m
  integer :: grid_size

  status = m%initialize(config_file)
  status = m%get_grid_size(grid_id, grid_size)
  status = m%finalize()

  if (grid_size.ne.expected_size) then
     stop BMI_FAILURE
  end if
end program test_get_grid_size
