defmodule Backend do

  alias Backend.Oauth.Sign_in, as: OauthSign_in
  alias Backend.Oauth.Refresh, as: OauthRefresh

  alias Backend.Users.Create, as: UserCreate
  alias Backend.Users.Index, as: UsersIndex
  alias Backend.Users.Show, as: UserShow

  alias Backend.Services.Create, as: ServiceCreate
  alias Backend.Services.Index, as: ServicesIndex

  alias Backend.Establishments.Index, as: EstablishmentsIndex
  alias Backend.Establishments.Create, as: EstablishmentsCreate

  alias Backend.Appointments.Create, as: AppointmentCreate
  alias Backend.Appointments.Index, as: AppointmentIndex

  defdelegate sign_in(params), to: OauthSign_in, as: :call
  defdelegate refresh(params), to: OauthRefresh, as: :call

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate select_users(), to: UsersIndex, as: :call
  defdelegate select_user(params), to: UserShow, as: :call

  defdelegate create_service(params), to: ServiceCreate, as: :call
  defdelegate select_services(), to: ServicesIndex, as: :call

  defdelegate create_establishment(params), to: EstablishmentsCreate, as: :call
  defdelegate select_establishments(params), to: EstablishmentsIndex, as: :call

  defdelegate create_appointment(params), to: AppointmentCreate, as: :call
  defdelegate select_appointments(), to: AppointmentIndex, as: :call
end
