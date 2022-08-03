# defmodule Eligon.Meeting.Board do
#   use Ecto.Schema
#   import Ecto.Changeset

#   schema "boards" do
#     field :description, :string
#     field :name, :string

#     belongs_to :user, Eligon.Users.User

#     timestamps()
#   end

#   @doc false
#   def changeset(board, attrs) do
#     board
#     |> cast(attrs, [:name, :description])
#     |> validate_required([:name, :description])

#   end
# end
