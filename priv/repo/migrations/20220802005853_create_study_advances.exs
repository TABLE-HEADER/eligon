defmodule Eligon.Repo.Migrations.CreateStudyAdvances do
  use Ecto.Migration

  def change do
    create table(:study_advances) do
      add :user_id, references(:users, type: :integer, on_delete: :delete_all)
      add :lesson_id, references(:study_lessons, type: :integer, on_delete: :delete_all)
      add :is_read, :boolean

      timestamps()
    end
  end
end
