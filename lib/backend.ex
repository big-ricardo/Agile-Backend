defmodule Backend do
  alias Backend.Users.Create, as: UserCreate
  alias Backend.Users.Index, as: UsersIndex
  alias Backend.Services.Create, as: ServiceCreate
  alias Backend.Services.Index, as: ServicesIndex
  alias Backend.Appointments.Create, as: AppointmentCreate

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate select_users(), to: UsersIndex, as: :call
  defdelegate create_service(params), to: ServiceCreate, as: :call
  defdelegate select_services(), to: ServicesIndex, as: :call
  defdelegate create_appointment(params), to: AppointmentCreate, as: :call
end
