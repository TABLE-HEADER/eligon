defmodule EligonWeb.StudyTextController do
  use EligonWeb, :controller
  alias Eligon.Studies

  def index(conn, _params) do
    textbook = Studies.get_textbook()
    render(conn, "index.html", textbook: textbook)
  end
end
