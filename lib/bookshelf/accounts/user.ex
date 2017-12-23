defmodule Bookshelf.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bookshelf.Accounts.User


  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :password_confirmation])
    |> validate_required([:username, :email, :password, :password_confirmation])
    |> validate_password_confirmation()
    |> unique_constraint(:email)
    |> unique_constraint(:username)
    |> put_password_hash
  end

  defp validate_password_confirmation(changeset) do
    password = get_change(changeset, :password)
    confirmation = get_change(changeset, :password_confirmation)

    case password == confirmation do
      true ->
        changeset
      false ->
        changeset # TODO: put some errors in, should use validate_change
    end
  end

  defp put_password_hash(changeset = %{valid?: true}) do
    password = get_change(changeset, :password)
    change(changeset, Comeonin.Bcrypt.add_hash(password))
  end

  defp put_password_hash(changeset) do
    changeset
  end
end
