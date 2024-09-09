defmodule EventsWeb.UserController do
  use EventsWeb, :controller

  alias Events.Accounts

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.html", users: users)
  end
end
