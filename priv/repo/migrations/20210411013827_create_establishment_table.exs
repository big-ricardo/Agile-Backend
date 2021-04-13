defmodule Backend.Repo.Migrations.CreateEstablishmentsTable do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS postgis")
    create table :establishments do

      add :zip_code, :string, size: 8, null: false
      add :city, :string, null: false
      add :state, :string, size: 2, null: false
      add :point, :geometry

      timestamps()
    end

    execute("CREATE INDEX zip_code_point_index on establishments USING gist (point)")

  end
end
