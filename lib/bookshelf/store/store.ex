defmodule Bookshelf.Store do
  @moduledoc """
  The Store context.
  """

  import Ecto.Query, warn: false
  alias Bookshelf.Repo

  alias Bookshelf.Store.LearningResource

  @doc """
  Returns the list of learning_resources.

  ## Examples

      iex> list_learning_resources()
      [%LearningResource{}, ...]

  """
  def list_learning_resources do
    Repo.all(LearningResource)
  end

  @doc """
  Gets a single learning_resource.

  Raises `Ecto.NoResultsError` if the Learning resource does not exist.

  ## Examples

      iex> get_learning_resource!(123)
      %LearningResource{}

      iex> get_learning_resource!(456)
      ** (Ecto.NoResultsError)

  """
  def get_learning_resource!(id), do: Repo.get!(LearningResource, id)

  @doc """
  Creates a learning_resource.

  ## Examples

      iex> create_learning_resource(%{field: value})
      {:ok, %LearningResource{}}

      iex> create_learning_resource(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_learning_resource(attrs \\ %{}) do
    %LearningResource{}
    |> LearningResource.changeset(attrs)
    |> Repo.insert()
  end
end
