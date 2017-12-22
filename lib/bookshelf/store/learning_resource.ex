defmodule Bookshelf.Store.LearningResource do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bookshelf.Store.LearningResource


  schema "learning_resources" do
    field :description, :string
    field :title, :string
    field :type, :string
    field :url, :string
    field :preview_image_url, :string

    timestamps()
  end

  @doc false
  def changeset(%LearningResource{} = learning_resource, attrs) do
    # TODO: make preview_image_url required after we have image uploads
    learning_resource
    |> cast(attrs, [:type, :title, :description, :url, :preview_image_url])
    |> validate_required([:type, :title, :description, :url])
    |> validate_inclusion(:type, ["book", "article", "video"])
    |> unique_constraint(:title)
  end
end
