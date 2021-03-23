defmodule PhoenixTrello.Router do
  use PhoenixTrello.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :auth do
    plug PhoenixTrello.GuardianPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhoenixTrello do
    pipe_through [:api, :auth]

    scope "/v1" do
      post "/registrations", RegistrationController, :create
      post "/sessions", SessionController, :create
    end
  end

  scope "/api", PhoenixTrello do
    pipe_through [:api, :auth, :ensure_auth]

    scope "/v1" do
      delete "/sessions", SessionController, :delete
      get "/current_user", CurrentUserController, :show
      resources "/boards", BoardController, only: [:index, :create] do
        resources "/cards", CardController, only: [:show]
      end
    end
  end

  scope "/", PhoenixTrello do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end
end
