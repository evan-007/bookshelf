defmodule Bookshelf.Repo.Migrations.AddUserIdToLearningResources do
  use Ecto.Migration

  def change do
    alter table(:learning_resources) do
      add :user_id, :integer
    end

    create index(:learning_resources, :user_id)
  end
end
