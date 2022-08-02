defmodule Eligon.Studies.StudyAdvance do
  use Ecto.Schema


  schema "study_advances" do
    # filed :user_id, references(:users, type: :binary_id, on_delete: :delete_all)
    # field :lesson_id, references(:study_lessons, type: :binary_id, on_delete: :delete_all)
    field :is_read, :boolean

    timestamps()

    belongs_to(:user, Eligon.Users.User)
    belongs_to(:lesson, Eligon.Studies.StudyLesson)
  end
end
