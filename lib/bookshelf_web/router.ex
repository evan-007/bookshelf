defmodule BookshelfWeb.Router do
  use BookshelfWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # TODO auth stuff should probably be in a guardian pipeline
    plug Guardian.Plug.VerifySession, module: BookshelfWeb.Guardian
    plug Guardian.Plug.LoadResource, module: BookshelfWeb.Guardian, allow_blank: true
    plug BookshelfWeb.Plugs.CurrentUser
  end


  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookshelfWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/learning_resources", LearningResourceController
  end

  scope "/auth", BookshelfWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
    post "/identity/callback", AuthController, :identity_callback

    resources "/sessions", SessionController, singleton: true, only: [:new, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", BookshelfWeb do
  #   pipe_through :api
  # end
end
