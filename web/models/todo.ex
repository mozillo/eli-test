defmodule HelloPhoenix.Todo do
  use HelloPhoenix.Web, :model

  schema "todos" do
    field :item, :string
    field :detail, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:item, :detail])
    |> validate_required([:item, :detail])
  end
end
