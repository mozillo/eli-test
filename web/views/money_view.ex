defmodule HelloPhoenix.MoneyView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{money: money}) do
    %{data: render_many(money, HelloPhoenix.MoneyView, "money.json")}
  end

  def render("show.json", %{money: money}) do
    %{data: render_one(money, HelloPhoenix.MoneyView, "money.json")}
  end

  def render("money.json", %{money: money}) do
    %{id: money.id,
      description: money.description,
      amount: money.amount,
      is_paid: money.is_paid,
      expired_at: money.expired_at,
      user_id: money.user_id}
  end
end
