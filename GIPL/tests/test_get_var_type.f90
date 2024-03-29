program test_get_var_type

  use bmif_1_2, only: BMI_FAILURE, BMI_MAX_TYPE_NAME
  use bmigiplf
  use fixtures, only: config_file, status

  implicit none

  character (len=*), parameter :: var_name = "land_surface_air__temperature"
  character (len=*), parameter :: expected_type = "real"

  type (bmi_gipl) :: m
  character (len=BMI_MAX_TYPE_NAME) :: var_type

  status = m%initialize(config_file)
  status = m%get_var_type(var_name, var_type)
  status = m%finalize()

  if (var_type.ne.expected_type) then
     stop BMI_FAILURE
  end if
end program test_get_var_type
