defmodule HelloPhoenix.Milestone do
  use HelloPhoenix.Web, :model

  schema "milestone" do
    field :target, :string
    field :archived, :string
    field :expired_at, Ecto.DateTime

    belongs_to :user, HelloPhoenix.User, foreign_key: :user_id 

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:target, :archived, :expired_at, :user_id])
    |> validate_required([:target, :archived, :expired_at, :user_id])
  end
end
