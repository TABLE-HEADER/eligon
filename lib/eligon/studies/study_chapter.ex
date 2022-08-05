defmodule Eligon.Studies.StudyChapter do
  use Ecto.Schema
  import Ecto.Changeset

  #@foreign_key_type :binary_id

  schema "study_chapters" do
    field :index, :integer
    field :title, :string
  end
end
