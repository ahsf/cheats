defmodule CheatsWeb.Router do
  use CheatsWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {CheatsWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", CheatsWeb do
    pipe_through :browser

    live "/", CheatsLive
  end
end
