defmodule BookshelfWeb.LearningResourceControllerTest do
  use BookshelfWeb.ConnCase
  @valid_params %{
    "title" => "title",
    "description" => "description",
  }

  test "GET /learning_resources", %{conn: conn} do
    conn = get conn, "/learning_resources"

    assert html_response(conn, 200)
  end

  # TODO: needs a way to authenticate w/guardian in test
  # test "POST /learning_resources when valid" , %{conn: conn} do
  #   response = conn
  #   |> post("/learning_resources", learning_resource: @valid_params)
  #
  #   assert 200 = response.status
  # end
end
