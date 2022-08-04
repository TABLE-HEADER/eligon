defmodule Eligon.Repo.Migrations.CreateChats do
  use Ecto.Migration

  def change do
    create table(:chats) do
      add :inner_text, :string
      add :is_deleted, :boolean, default: false
      add :is_edited, :boolean, default: false
      add :user_id, references(:users, type: :integer, on_delete: :nothing)

      timestamps()
    end
  end
end
