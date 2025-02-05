defmodule RecruitmentTest.Repo.Migrations.AddEmployeesTable do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :name, :string, null: false
      add :position, :string, null: false
      add :enterprise_id, references(:enterprises, on_delete: :delete_all), null: false

      timestamps()
    end

    create index(:employees, [:enterprise_id])
  end
end
