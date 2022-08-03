defmodule Eligon.Repo.Migrations.CreateBoards do
  use Ecto.Migration

  def change do
    create table(:boards) do
      add :inner_text, :string
      add :user_id, references(:users, type: :integer, on_delete: :nothing)

      timestamps()
    end
  end
end
