defmodule EventsWeb.UserControllerTest do
  use EventsWeb.ConnCase

  test "GET /users", %{conn: conn} do
    conn = get(conn, "/users")
    assert html_response(conn, 200)
  end
end
