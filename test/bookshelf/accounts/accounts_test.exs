defmodule Bookshelf.AccountsTest do
  use Bookshelf.DataCase

  alias Bookshelf.Accounts

  describe "users" do
    alias Bookshelf.Accounts.User

    @valid_attrs %{
      email: "some email",
      password: "password",
      password_confirmation: "password",
      username: "some username",
    }
    @invalid_attrs %{email: nil, password_hash: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.username == "some username"
      assert user.password_hash
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end
  end
end
