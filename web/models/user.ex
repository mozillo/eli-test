defmodule HelloPhoenix.User do
  use HelloPhoenix.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :last_login_at, Ecto.DateTime

    has_many :milestones, Milestone

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :encrypted_password, :last_login_at])
    |> validate_required([:name, :email, :encrypted_password, :last_login_at])
  end
end
