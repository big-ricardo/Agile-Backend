defmodule Backend.Repo.Migrations.CreateAppointmentsTable do
  use Ecto.Migration

  def change do
    create table :appointments do
      add :services_id, references(:services, type: :binary_id)
      add :users_id, references(:users, type: :binary_id)
      add :date_time, :string

      timestamps()
    end
  end
end
