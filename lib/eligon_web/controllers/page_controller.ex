defmodule EligonWeb.PageController do
  use EligonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
