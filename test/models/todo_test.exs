defmodule HelloPhoenix.TodoTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Todo

  @valid_attrs %{detail: "some content", item: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Todo.changeset(%Todo{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Todo.changeset(%Todo{}, @invalid_attrs)
    refute changeset.valid?
  end
end
