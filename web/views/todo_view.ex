defmodule HelloPhoenix.TodoView do
  use HelloPhoenix.Web, :view

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, HelloPhoenix.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, HelloPhoenix.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      item: todo.item,
      detail: todo.detail,
      created_at: todo.inserted_at,
      updated_at: todo.updated_at}
  end
end
