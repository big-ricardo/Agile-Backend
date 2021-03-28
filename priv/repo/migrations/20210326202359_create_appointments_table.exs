defmodule Backend.Repo.Migrations.CreateAppointmentsTable do
  use Ecto.Migration

  def change do
    create table :appointments do
      add :user_id, references(:users, type: :binary_id)
      add :seller_id, references(:users, type: :binary_id)
      add :service, references(:services, type: :binary_id)
      add :date_time, :string

      timestamps()
    end
  end
end
