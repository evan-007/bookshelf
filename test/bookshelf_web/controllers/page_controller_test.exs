defmodule BookshelfWeb.PageControllerTest do
  use BookshelfWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Hello Bookshelf"
  end
end
