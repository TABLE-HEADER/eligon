defmodule EligonWeb.UserController do
  use EligonWeb, :controller

  alias Eligon.Users
  alias Eligon.Users.User

  def new(conn, _params) do
    changeset = Users.change_registation(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params})do
    case Users.register_user(user_params) do
      {:ok, user} ->
        conn
        |> 
end
