defmodule BookshelfWeb.AuthController do
  use BookshelfWeb, :controller
  plug Ueberauth

  alias Bookshelf.Accounts

  def request(conn, _params) do
    render conn, "request.html"
  end

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = auth.extra.raw_info # raw form data

    case Accounts.create_user(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "thanks for signing up")
        |> redirect(to: learning_resource_path(conn, :index))
      {:error, changeset} ->
        # TODO: put error data in the form
        render conn, "request.html", changeset: changeset
    end
  end
end
