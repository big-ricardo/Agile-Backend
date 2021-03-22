defmodule Backend.Repo.Migrations.CreateUserTable do
  use Ecto.Migration

  def change do
    create  table :users do
      add :name, :string
      add :email, :string
      add :password_hash, :string
      add :nickname, :string
      add :avatar, :string

      timestamps()
    end

    create unique_index(:users, [:email])
    create unique_index(:users, [:nickname])
  end
end
