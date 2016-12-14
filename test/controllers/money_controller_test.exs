defmodule HelloPhoenix.MoneyControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Money
  @valid_attrs %{amount: "120.5", description: "some content", expired_at: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, is_paid: true, user_id: 42}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, money_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    money = Repo.insert! %Money{}
    conn = get conn, money_path(conn, :show, money)
    assert json_response(conn, 200)["data"] == %{"id" => money.id,
      "description" => money.description,
      "amount" => money.amount,
      "is_paid" => money.is_paid,
      "expired_at" => money.expired_at,
      "user_id" => money.user_id}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, money_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, money_path(conn, :create), money: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Money, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, money_path(conn, :create), money: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    money = Repo.insert! %Money{}
    conn = put conn, money_path(conn, :update, money), money: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Money, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    money = Repo.insert! %Money{}
    conn = put conn, money_path(conn, :update, money), money: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    money = Repo.insert! %Money{}
    conn = delete conn, money_path(conn, :delete, money)
    assert response(conn, 204)
    refute Repo.get(Money, money.id)
  end
end
