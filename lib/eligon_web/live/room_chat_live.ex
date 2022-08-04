defmodule EligonWeb.RoomChatLive do
  # use EligonWeb, :live
  use Phoenix.LiveView
  alias Eligon.Chats
  alias Eligon.Chats.Chat
  alias Eligon.Repo
  import Ecto.Query

  def render(assigns) do
    EligonWeb.RoomChatView.render(assigns.template, assigns)
  end

  def mount(_params, session, socket) do
    chats = Chats.get_chats()

    query_ut = from(ut in Eligon.Users.UserToken, where: ut.token == ^session["user_token"])
    user_token = Repo.one(query_ut)

    socket =
      socket
        |> assign(:page_title, "チャット")
        |> assign(:template, "index.html")
        |> assign(:chats, chats)
        |> assign(:changeset, Chat.build_changeset())
        |> assign(:user_id, user_token.user_id)
        |> assign(:edit_text, %{id: 0, text: ""})

    {:ok, socket}
  end

  def handle_event("new_text", %{"chat" => %{"inner_text" => inner_text}}, socket) do
    Chat.changeset(%Chat{}, %{inner_text: inner_text, user_id: socket.assigns.user_id})
    |> Repo.insert()

    chats = Chats.get_chats()
    socket = %{socket | assigns: %{socket.assigns | chats: chats, changeset: Chat.build_changeset()}}
    {:noreply, socket}
  end

  def handle_event("edit", %{"id" => id}, socket) do
    inner_text = Repo.get(Chat, id).inner_text
    socket = %{socket | assigns: %{socket.assigns | edit_text: %{id: id, text: inner_text}}}

    {:noreply, socket}
  end

  def handle_event("edit_cancel", _params, socket) do
    socket = %{socket | assigns: %{socket.assigns | edit_text: %{id: 0, text: ""}}}

    {:noreply, socket}
  end

  def handle_event("delete", %{"id" => id}, socket) do
    Chat.changeset(Repo.get(Chat, id), %{inner_text: "削除しました"})
    |> Repo.update()

    chats = Chats.get_chats()
    socket = %{socket | assigns: %{socket.assigns | chats: chats}}
    {:noreply, put_flash(socket, :info, "投稿を削除しました。")}
  end

end
