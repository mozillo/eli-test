defmodule HelloPhoenix.Repo.Migrations.CreateMoney do
  use Ecto.Migration

  def change do
    create table(:money) do
      add :description, :text
      add :amount, :decimal
      add :is_paid, :boolean, default: false, null: false
      add :expired_at, :datetime
      add :user_id, :integer

      timestamps()
    end

  end
end
