defmodule HelloPhoenix.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :item, :string
      add :detail, :string

      timestamps()
    end

  end
end
