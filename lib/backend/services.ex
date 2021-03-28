defmodule Backend.Services do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:name, :duration, :price, :users_id]

  schema "services" do
    belongs_to :users, Backend.Users
    field :name, :string
    field :duration, :integer
    field :price, :decimal

    timestamps()
  end

  def changeset (params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end

end
