defmodule Eligon.Chats do
  alias Eligon.Repo
  alias Eligon.Chats.Chat
  alias Eligon.Users.User
  import Ecto.Query

  def get_chats() do
    from(c in Chat, order_by: [asc: :inserted_at])
    |> Repo.all()
    |> Enum.map(fn x ->
      query = from(u in User, where: u.id == ^x.user_id, select: u.nickname)
      nickname = Repo.one(query)
      Map.put(Map.from_struct(x), :nickname, nickname)
    end)
  end

  def search_chats(search_text) do
    query_text = "%" <> search_text <> "%"
    from(c in Chat, where: like(c.inner_text, ^query_text) and c.is_deleted == false, order_by: [asc: :inserted_at])
    |> Repo.all()
    |> Enum.map(fn x ->
      query = from(u in User, where: u.id == ^x.user_id, select: u.nickname)
      nickname = Repo.one(query)
      Map.put(Map.from_struct(x), :nickname, nickname)
    end)
  end

end
