defmodule Eligon.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :inner_text, :string

    belongs_to :user, Eligon.Users.User

    timestamps()
  end

  def changeset(board, attrs) do
    board
    |> cast(attrs, [:inner_text])
    |> validate_required([:inner_text])
  end
end
