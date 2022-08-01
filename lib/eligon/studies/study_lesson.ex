defmodule Eligon.Studies.StudyLesson do
  use Ecto.Schema
  import Ecto.Changeset

  #@foreign_key_type :binary_id

  schema "study_lessons" do
    field :lesson, :string
    field :link, :string

    timestamps()

    belongs_to(:study_chapter, Eligon.Studies.StudyChapter)
  end
end
