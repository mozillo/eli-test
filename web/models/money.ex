defmodule HelloPhoenix.Money do
  use HelloPhoenix.Web, :model

  schema "money" do
    field :description, :string
    field :amount, :decimal
    field :is_paid, :boolean, default: false
    field :expired_at, Ecto.DateTime
    field :user_id, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:description, :amount, :is_paid, :expired_at, :user_id])
    |> validate_required([:description, :amount, :is_paid, :expired_at, :user_id])
  end
end
