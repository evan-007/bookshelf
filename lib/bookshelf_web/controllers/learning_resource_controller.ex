defmodule BookshelfWeb.LearningResourceController do
  use BookshelfWeb, :controller
  alias Bookshelf.Store

  def index(conn, _params) do
    learning_resources = Store.list_learning_resources()

    render conn, "index.html", learning_resources: learning_resources
  end

  def new(conn, _params) do
    # TODO: should only allow current_user to do this?
    changeset = Store.new_learning_resource()

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"learning_resource" => learning_resource_params}) do
    case learning_resource_params
    |> Enum.into(%{"user_id" => conn.assigns.current_user.id}) # assumes user is logged in
    |> Store.create_learning_resource() do
      {:ok, learning_resource} ->
        conn
        |> put_flash(:info, "resource created, thanks!")
        |> redirect(to: learning_resource_path(conn, :show, learning_resource))
      {:error, changeset} ->
        conn
        |> render "new.html", changeset: changeset
    end
  end

  def show(conn, %{"id" => id}) do
    learning_resource = Store.get_learning_resource!(id)

    conn
    |> render "show.html", learning_resource: learning_resource
  end
end
