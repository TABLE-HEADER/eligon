defmodule Eligon.Studies.StudyAdvance do
  use Ecto.Schema
  import Ecto.Changeset

  schema "study_advances" do
    # filed :user_id, references(:users, type: :binary_id, on_delete: :delete_all)
    # field :lesson_id, references(:study_lessons, type: :binary_id, on_delete: :delete_all)
    field :is_read, :boolean

    timestamps()

    # belongs_toは「第一引数_id」のフィールド名のフィールドを作ります。
    # なので、user_id と、 lesson_id のフィールド(関連付け済み)ができていることになります。
    belongs_to(:user, Eligon.Users.User)
    belongs_to(:lesson, Eligon.Studies.StudyLesson)
  end

  def build_changeset do
    cast(%__MODULE__{}, %{}, [])
  end

  def changeset(advance, attrs \\ %{}) do
    advance
    |> cast(attrs, [:is_read, :user_id, :lesson_id])
  end
end
