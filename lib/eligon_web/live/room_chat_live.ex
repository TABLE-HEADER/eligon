defmodule EligonWeb.RoomChatLive do
  # use EligonWeb, :live
  use Phoenix.LiveView
  alias Eligon.Chats
  alias Eligon.Chats.Chat
  alias Eligon.Repo
  require Ecto.Query

  def render(assigns) do
    EligonWeb.RoomChatView.render(assigns.template, assigns)
  end

  def mount(_params, session, socket) do
    chats = Chats.get_chats()

    query_ut = Ecto.Query.from(ut in Eligon.Users.UserToken, where: ut.token == ^session["user_token"])
    user_token = Repo.one(query_ut)

    socket =
      socket
        |> assign(:page_title, "チャット")
        |> assign(:template, "index.html")
        |> assign(:chats, chats)
        |> assign(:changeset, Chat.build_changeset())
        |> assign(:user_id, user_token.user_id)
        |> assign(:edit_text, %{id: 0, text: ""})
        |> assign(:search_text, "")
        |> assign(:mode, :show_all)

    {:ok, socket}
  end

  def handle_event("show_all", _params, socket) do
    chats = Chats.get_chats()

    socket =
      socket
      |> update(:chats, fn _x -> chats end)
      |> update(:search_text, fn _x -> "" end)
      |> update(:mode, fn _x -> :show_all end)
    {:noreply, socket}
  end

  def handle_event("search", %{"chat" => %{"search_text" => search_text}}, socket) do
    chats = Chats.search_chats(search_text)

    socket =
      socket
      |> update(:chats, fn _x -> chats end)
      |> update(:search_text, fn _x -> search_text end)
      |> update(:mode, fn _x -> :search end)
    {:noreply, socket}
  end

  def handle_event("new_text", %{"chat" => %{"inner_text" => inner_text}}, socket)
    when socket.assigns.edit_text.id != 0 do
    Chat.changeset(Repo.get(Chat, socket.assigns.edit_text.id), %{inner_text: inner_text, user_id: socket.assigns.user_id, is_edited: true})
    |> Repo.update()

    chats = Chats.get_chats()
    socket =
      socket
      |> update(:chats, fn _x -> chats end)
      |> update(:edit_text, fn _x -> %{id: 0, text: ""} end)
    {:noreply, socket}
  end

  def handle_event("new_text", %{"chat" => %{"inner_text" => inner_text}}, socket) do
    Chat.changeset(%Chat{}, %{inner_text: inner_text, user_id: socket.assigns.user_id})
    |> Repo.insert()

    chats = Chats.get_chats()
    socket = update(socket, :chats, fn _x -> chats end)
    {:noreply, socket}
  end

  def handle_event("edit", %{"id" => id}, socket) do
    inner_text = Repo.get(Chat, id).inner_text
    socket = update(socket, :edit_text, fn _x -> %{id: id, text: inner_text} end)

    {:noreply, socket}
  end

  def handle_event("edit_cancel", _params, socket) do
    socket = update(socket, :edit_text, fn _x -> %{id: 0, text: ""} end)

    {:noreply, socket}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    Chat.changeset(Repo.get(Chat, id), %{is_deleted: true})
    |> Repo.update()

    chats = Chats.get_chats()
    socket = update(socket, :chats, fn _x -> chats end)
    {:noreply, socket}
  end

end
