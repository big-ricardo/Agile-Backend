defmodule Backend.Establishments do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:zip_code, :city, :state, :lat, :lgn]

  schema "establishments" do
    field :zip_code, :string
    field :city, :string
    field :state, :string
    field :point, Geo.PostGIS.Geometry
    field :lat, :float, virtual: true
    field :lgn, :float, virtual: true

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> formatedPoint()
    |> IO.inspect()
  end

  defp formatedPoint(%Ecto.Changeset{valid?: true, changes: changes} = changeset) do
    geom = %Geo.Point{coordinates: {Map.get(changes, :lat), Map.get(changes, :lgn)}, srid: 4326}
    changes = Map.put(changes, :point, geom)
    %{changeset | changes: changes}
  end

  defp formatedPoint(params) do
    params
  end
end
