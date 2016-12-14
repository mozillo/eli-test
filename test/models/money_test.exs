defmodule HelloPhoenix.MoneyTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Money

  @valid_attrs %{amount: "120.5", description: "some content", expired_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, is_paid: true, user_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Money.changeset(%Money{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Money.changeset(%Money{}, @invalid_attrs)
    refute changeset.valid?
  end
end
