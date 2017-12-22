defmodule Bookshelf.Repo.Migrations.CreateLearningResources do
  use Ecto.Migration

  def change do
    create table(:learning_resources) do
      add :type, :string
      add :title, :string
      add :description, :text
      add :url, :string
      add :preview_image_url, :string

      timestamps()
    end

    create unique_index(:learning_resources, :title)
  end
end
