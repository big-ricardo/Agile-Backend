defmodule Backend.Appointments do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:services_id, :date_time, :users_id]

  schema "appointments" do
    belongs_to :services, Backend.Services
    belongs_to :users, Backend.Users
    field :date_time, :string
    timestamps()
  end

  def changeset (params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

end
