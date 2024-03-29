program test_get_grid_type

  use bmif_1_2, only: BMI_FAILURE, BMI_MAX_TYPE_NAME
  use bmigiplf
  use fixtures, only: config_file, status

  implicit none

  integer, parameter :: grid_id = 0
  character (len=*), parameter :: &
       expected_type = "points"

  type (bmi_gipl) :: m
  character (len=BMI_MAX_TYPE_NAME) :: grid_type

  status = m%initialize(config_file)
  status = m%get_grid_type(grid_id, grid_type)
  status = m%finalize()

  if (grid_type.ne.expected_type) then
     stop BMI_FAILURE
  end if
end program test_get_grid_type
