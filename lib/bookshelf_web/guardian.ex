defmodule BookshelfWeb.Guardian do
  use Guardian, otp_app: :bookshelf

  alias Bookshelf.Accounts.User

  def subject_for_token(user = %User{}, _claims) do
    {:ok, "User:" <> to_string(user.id)}
  end

  def subject_for_token(_, _) do
    {:error, :unknown_resource}
  end

  def resource_from_claims(claims) do
    # Here we'll look up our resource from the claims, the subject can be
    # found in the `"sub"` key. In `above subject_for_token/2` we
    # returned
    # the resource id so here we'll rely on that to look it up.
    id = claims["sub"]
          |> String.split(":")
          |> List.last

    resource = Bookshelf.Accounts.get_user(id)
    {:ok,  resource}
  end

  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end
end
