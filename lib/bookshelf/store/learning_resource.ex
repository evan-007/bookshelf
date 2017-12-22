defmodule Bookshelf.Store.LearningResource do
  use Ecto.Schema
  import Ecto.Changeset
  alias Bookshelf.Store.LearningResource


  schema "learning_resources" do
    field :description, :string
    field :title, :string
    field :type, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%LearningResource{} = learning_resource, attrs) do
    learning_resource
    |> cast(attrs, [:type, :title, :description, :url])
    |> validate_required([:type, :title, :description, :url])
    |> validate_inclusion(:type, ["book", "article", "video"])
    |> unique_constraint(:title)
  end
end
