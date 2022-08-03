defmodule EligonWeb.RoomChatLive do
  # use EligonWeb, :live
  use Phoenix.LiveView
  # alias Eligon.

  def render(assigns) do
    EligonWeb.RoomChatView.render(assigns.template, assigns)
  end

  def mount(_params, _seesion, socket) do

    socket =
      socket
        |> assign(:page_title, "チャット")
        |> assign(:template, "index.html")

    {:ok, socket}
  end
end
