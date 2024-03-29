! Test the get_value, get_value_ptr, and get_value_at_indices functions.
program get_value_ex

  use bmif_1_2, only: BMI_MAX_VAR_NAME
  use bmigiplf
  use testing_helpers
  implicit none

  type (bmi_gipl) :: m
  integer :: s, i, j, grid_id
  character (len=BMI_MAX_VAR_NAME), pointer :: names(:)
  character (len=BMI_MAX_VAR_NAME), parameter :: config_file = "test.cfg"
  integer :: grid_size, dims(2), locations(3)
  real, allocatable :: z(:), y(:)
  real, pointer :: x(:)
  double precision :: time

  write (*,"(a)",advance="no") "Initializing..."
  s = m%initialize(config_file)
  write (*,*) "Done."

  s = m%get_output_var_names(names)
  do i =1,2
  write (*,"(a, i3, ': ', a)") "Output variables ", i, trim(names(i))
  enddo
  s = m%get_var_grid(names(1), grid_id)
  s = m%get_grid_shape(grid_id, dims)
  write(*,'(a,2i4)') 'Grid shape (ny,nx): ', dims
  s = m%get_grid_size(grid_id, grid_size)
  write(*,'(a,i8)') 'Grid size: ', grid_size
  
  write (*, "(a)") "Initial values:"
  allocate(z(grid_size))
  s = m%get_value("land_surface_air__temperature", z)
  write (*, "(a, i5)") "Shape of returned values:", shape(z)
  
  write (*,"(a)") "Running (using get_value)..."
  do j = 1, 4
     s = m%update()
     s = m%get_value("land_surface_air__temperature", z)
     s = m%get_current_time(time)
     write (*,"(a, f6.1)") "Current time:", time
  end do
  write (*,"(a)") "Done."

  write (*,"(a)", advance="no") "Finalizing..."
  s = m%finalize()
  write (*,*) "Done"

end program get_value_ex
