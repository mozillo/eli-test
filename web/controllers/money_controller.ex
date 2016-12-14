defmodule HelloPhoenix.MoneyController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Money

  def index(conn, _params) do
    money = Repo.all(Money)
    render(conn, "index.json", money: money)
  end

  def create(conn, %{"money" => money_params}) do
    changeset = Money.changeset(%Money{}, money_params)

    case Repo.insert(changeset) do
      {:ok, money} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", money_path(conn, :show, money))
        |> render("show.json", money: money)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HelloPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    money = Repo.get!(Money, id)
    render(conn, "show.json", money: money)
  end

  def update(conn, %{"id" => id, "money" => money_params}) do
    money = Repo.get!(Money, id)
    changeset = Money.changeset(money, money_params)

    case Repo.update(changeset) do
      {:ok, money} ->
        render(conn, "show.json", money: money)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(HelloPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    money = Repo.get!(Money, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(money)

    send_resp(conn, :no_content, "")
  end
end
