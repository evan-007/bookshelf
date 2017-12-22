defmodule Bookshelf.StoreTest do
  use Bookshelf.DataCase

  alias Bookshelf.Store

  describe "learning_resources" do
    alias Bookshelf.Store.LearningResource

    @valid_attrs %{
      description: "some description",
      title: "some title",
      type: "book",
      url: "some url",
      preview_image_url: "some image",
    }
    @invalid_attrs %{description: nil, title: nil, type: nil, url: nil}

    def learning_resource_fixture(attrs \\ %{}) do
      {:ok, learning_resource} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_learning_resource()

      learning_resource
    end

    test "create_learning_resource/1 creates a LearningResource when valid" do
      learning_resource_fixture()
      learning_resource_fixture(%{type: "book", title: "2", description: "asdf"})
      resources_count = Store.list_learning_resources |> length

      assert resources_count == 2
    end

    test "create_learning_resource/1 returns a changeset when invalid" do
      {:error, changeset} = Store.create_learning_resource(@invalid_attrs)

      assert "can't be blank" in errors_on(changeset).title
      assert "can't be blank" in errors_on(changeset).description
      assert "can't be blank" in errors_on(changeset).url
      assert "can't be blank" in errors_on(changeset).type
    end

    test "create_learning_resource/1 when duplicate title" do
      {:ok, _} = Store.create_learning_resource(@valid_attrs)
      {:error, changeset} = Store.create_learning_resource(@valid_attrs)

      assert "has already been taken" in errors_on(changeset).title
    end

    test "create_learning_resource/1 when type is not valid" do
      {:error, changeset} = Store.create_learning_resource(%{type: "cat"})

      assert "is invalid" in errors_on(changeset).type
    end

    test "get_learning_resource!/1 returns a learning resource" do
      learning_resource = learning_resource_fixture()
      %LearningResource{id: id} = learning_resource

      assert learning_resource == Store.get_learning_resource!(id)
    end

    test "get_learning_resource!/1 when not found" do
      error = catch_error(Store.get_learning_resource!(9))

      assert %Ecto.NoResultsError{} = error
    end
  end
end
