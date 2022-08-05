defmodule Eligon.Repo.Migrations.CreateStudyChapters do
  use Ecto.Migration

  def change do
    create table(:study_chapters) do
      add :index, :integer, null: false
      add :title, :string, null: false
    end
  end
end
