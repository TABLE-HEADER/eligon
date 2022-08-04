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

  def mount(_params, session, socket) do
    textbook = Studies.get_textbook()
    advances = Studies.get_all_advances_by_userid(session["user_id"])

    socket =
      socket
        |> assign(:page_title, "学習")
        |> assign(:template, "index.html")
        |> assign(:textbook, textbook)
        |> assign(:changeset, Eligon.Studies.StudyAdvance.build_changeset())
        |> assign(:advances, advances)

    {:ok, socket}
  end

  def handle_event("check", %{"study_advance" => study_advance}, socket) do
    IO.inspect(study_advance)
    # こういう型で入ってきています。
    # %{"is_read" => "true", "lesson_id" => "1", "user_id" => "4"}
    %{"is_read" => is_read, "lesson_id" => lesson_id, "user_id" => user_id}
      = study_advance

    # 再束縛しています！！(元の文字列を適切なものにしました。)
    is_read = String.to_atom(is_read)
    lesson_id = String.to_integer(lesson_id)
    user_id = String.to_integer(user_id)

    if is_read do
      Studies.get_advance_and_update(user_id, lesson_id, :true)
    else
      Studies.get_advance_and_update(user_id, lesson_id, :false)
    end

    IO.inspect("成功！！")
    IO.inspect("---------------------------")
    IO.inspect("at study_text_live.ex:48")
    {:noreply, socket}
  end
end
