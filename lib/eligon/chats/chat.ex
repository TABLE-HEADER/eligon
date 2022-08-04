defmodule Eligon.Chats.Chat do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chats" do
    field :inner_text, :string

    belongs_to :user, Eligon.Users.User

    timestamps()
  end

  def build_changeset do
    cast(%__MODULE__{}, %{}, [])
  end

  def changeset(chats, attrs) do
    chats
    |> cast(attrs, [:inner_text, :user_id])
    |> validate_required([:inner_text, :user_id])
  end
end
