defmodule Backend.Repo.Migrations.CreateServicesTable do
  use Ecto.Migration

  def change do
    create  table :services do
      add :users_id, references(:users, type: :binary_id)
      add :name, :string
      add :duration, :integer
      add :price, :decimal

      timestamps()
    end
  end
end
