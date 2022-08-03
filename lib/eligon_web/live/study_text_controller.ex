defmodule EligonWeb.StudyTextLive do
  # use EligonWeb, :live
  use Phoenix.LiveView
  alias Eligon.Studies

  # def index(conn, _params) do
  #   textbook = Studies.get_textbook()
  #   render(conn, "index.html", textbook: textbook)
  # end

  def render(assigns) do
    EligonWeb.StudyTextView.render(assigns.template, assigns)
  end

  def mount(_params, _seesion, socket) do
    textbook = Studies.get_textbook()

    socket =
      socket
        |> assign(:page_title, "学習")
        |> assign(:template, "index.html")
        |> assign(:textbook, textbook)
        |> assign(:changeset, Eligon.Studies.StudyAdvance.build_changeset())

    IO.inspect(Map.from_struct(socket))

    {:ok, socket}
  end

  def handle_event("check", %{"study_advance" => study_advance}, socket) do
    IO.inspect(study_advance)

    if study_advance["is_read"] do
      #
    else
      #
    end

    {:noreply, socket}
  end
end
