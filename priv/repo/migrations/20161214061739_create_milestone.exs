defmodule HelloPhoenix.Repo.Migrations.CreateMilestone do
  use Ecto.Migration

  def change do
    create table(:milestone) do
      add :target, :string
      add :archived, :text
      add :expired_at, :datetime
      add :user_id, :integer

      timestamps()
    end

  end
end
