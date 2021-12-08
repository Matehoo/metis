defmodule MetisWeb.PingTest do
  use MetisWeb.ConnCase

  test "GET /ping", %{conn: conn} do
    conn = get(conn, "/ping")

    assert response(conn, 200)
  end
end
