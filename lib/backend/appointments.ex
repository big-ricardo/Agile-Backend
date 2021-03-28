defmodule Backend.Appointments do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:service, :price, :seller]

  schema "appointments" do
    belongs_to :user, Backend.Users
    belongs_to :service, Backend.Services
    belongs_to :seller, Backend.Users
    field :date_time, :string
    timestamps()
  end

  def changeset (params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

end
