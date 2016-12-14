defmodule HelloPhoenix.MilestoneTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Milestone

  @valid_attrs %{archived: "some content", expired_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, target: "some content", user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Milestone.changeset(%Milestone{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Milestone.changeset(%Milestone{}, @invalid_attrs)
    refute changeset.valid?
  end
end
