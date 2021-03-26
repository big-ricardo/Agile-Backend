defmodule Backend.Users do
    use Ecto.Schema
    import Ecto.Changeset

    @primary_key {:id, :binary_id, autogenerate: true}
    @required_params [:name, :email, :password, :nickname, :avatar]

    schema "users" do
      field :name, :string
      field :email, :string
      field :password, :string, virtual: true
      field :password_hash, :string
      field :nickname, :string
      field :avatar, :string

      timestamps()
    end

    def changeset (params) do
      %__MODULE__{}
      |> cast(params, @required_params)
      |> validate_required(@required_params)
      |> validate_length(:password, min: 6)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint([:email])
      |> unique_constraint([:nickname])
      |> put_password_hash()
    end

    defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
      change(changeset, %{password_hash: password})
    end

    defp put_password_hash(changeset), do: changeset


end