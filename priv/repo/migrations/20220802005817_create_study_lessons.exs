defmodule Eligon.Repo.Migrations.CreateStudyLessons do
  use Ecto.Migration

  def change do
    create table(:study_lessons) do
      add :chapter_id, references(:study_chapters, type: :integer, on_delete: :delete_all)
      add :index, :integer, null: false
      add :lesson, :string
      add :description, :string
      add :link, :string

      timestamps()
    end
  end
end
