defmodule BookshelfWeb.LearningResourceControllerTest do
  use BookshelfWeb.ConnCase

  test "GET /learning_resources", %{conn: conn} do
    conn = get conn, "/learning_resources"

    assert html_response(conn, 200)
  end
end
