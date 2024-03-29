! Test the set_value and set_value_at_indices functions.
program set_value_ex

  use bmif_1_2, only: BMI_MAX_VAR_NAME
  use bmigiplf
  use testing_helpers
  implicit none

  type (bmi_gipl) :: m
  integer :: s, i, j, grid_id
  character (len=BMI_MAX_VAR_NAME), pointer :: names(:)
  character (len=BMI_MAX_VAR_NAME), parameter :: config_file = "test.cfg"
  integer :: grid_size, dims(2), locations(3)
  real :: values(3)
  real, allocatable :: z(:), y(:)
  character(len=30) :: rowfmt

  write (*,"(a)",advance="no") "Initializing..."
  s = m%initialize(config_file)
  write (*,*) "Done."

  s = m%get_input_var_names(names)
  do i = 1, 3
  write (*,"(a, i3, ': ', a)") "Output variables ", i, trim(names(i))
  enddo
  
  s = m%get_var_grid(names(1), grid_id)
  s = m%get_grid_shape(grid_id, dims)
  write(rowfmt,'(a,i4,a)') '(', dims(2), '(1x,f6.1))'
  s = m%get_grid_size(grid_id, grid_size)
  write(*,'(a,i8)') 'Grid size: ', grid_size

  write (*, "(a)") "Initial values:"
  allocate(z(grid_size))
  s = m%get_value("land_surface_air__temperature", z)
  print *, z
  
  write (*,"(a)",advance="no") "Setting new values..."
  z = 42.0
  s = m%set_value("land_surface_air__temperature", [z])
  write (*,*) "Done."
  write (*, "(a)") "New values:"
  allocate(y(grid_size))
  s = m%get_value("land_surface_air__temperature", y)
  print *, y
  
  write (*,"(a)", advance="no") "Finalizing..."
  deallocate(z, y)
  s = m%finalize()
  write (*,*) "Done"

end program set_value_ex
