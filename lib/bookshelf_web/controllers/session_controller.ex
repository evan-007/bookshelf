require IEx
defmodule BookshelfWeb.SessionController do
  use BookshelfWeb, :controller
  alias Bookshelf.Accounts

  def create(conn, %{"email" => email, "password" => password}) do
    user = Accounts.get_user_by_email(email)
    cond do
      user && check_password(user, password) ->
        # do something to persist the session with guardian
        conn
        |> put_flash(:info, "Welcome back")
        |> redirect(to: learning_resource_path(conn, :index))
      true ->
        Comeonin.Bcrypt.dummy_checkpw()
        conn
        |> put_flash(:error, "Email or password is incorrect")
        |> redirect(to: session_path(conn, :new))
    end
  end

  def new(conn, _params) do
    render conn, "new.html"
  end

  defp check_password(user, password) do
    check = user
    |> Comeonin.Bcrypt.check_pass(password)
    case check do
      {:ok, _} ->
        true
       _ ->
         false
    end
  end
end
