defmodule BookshelfWeb.LearningResourceController do
  use BookshelfWeb, :controller
  alias Bookshelf.Store

  def index(conn, _params) do
    learning_resources = Store.list_learning_resources()

    render conn, "index.html", learning_resources: learning_resources
  end
end
