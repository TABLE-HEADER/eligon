defmodule Eligon.Studies.StudyLesson do
  use Ecto.Schema
  import Ecto.Changeset

  #@foreign_key_type :binary_id

  schema "study_lessons" do
    field :index, :integer
    field :lesson, :string
    field :description, :string
    field :link, :string

    timestamps()

    belongs_to(:chapter, Eligon.Studies.StudyChapter)
  end
end
