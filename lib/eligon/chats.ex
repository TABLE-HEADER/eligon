defmodule Eligon.Chats do
  alias Eligon.Repo
  alias Eligon.Chats.Chat
  alias Eligon.Users.User
  import Ecto.Query

  def get_chats() do
    chats =
      from(c in Chat, order_by: [asc: :inserted_at])
      |> Repo.all()
      |> Enum.map(fn x ->
        query = from(u in User, where: u.id == ^x.user_id, select: u.nickname)
        nickname = Repo.one(query)
        Map.put(Map.from_struct(x), :nickname, nickname)
      end)
  end

end
