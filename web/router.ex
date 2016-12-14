defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router
  use Addict.RoutesHelper
  
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/editor", PageController, :editor
    get "/hello", HelloController, :index

    resources "/milestone", MilestoneController
  end

  scope "/" do
    addict :routes
  end

  # Other scopes may use custom stacks.
  scope "/api", HelloPhoenix do
    pipe_through :api
    
    resources "/todos", TodoController, except: [:new, :edit]
    resources "/money", MoneyController, except: [:new, :edit]

  end
end
