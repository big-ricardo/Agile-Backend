defmodule BackendWeb.Router do
  use BackendWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Backend.Session.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/api", BackendWeb do
    pipe_through [:api]

    get "/oauth", OauthController, :refresh
    post "/oauth", OauthController, :sign_in

    post "/users", UsersController, :create

  end

  scope "/api", BackendWeb do
    pipe_through [:api, :auth, :ensure_auth]

    get "/user", UsersController, :show
    get "/users", UsersController, :index

    post "/services", ServicesController, :create
    get "/services", ServicesController, :index

    post "/appointments", AppointmentsController , :create
    get "/appointments", AppointmentsController , :index

    post "/establishments", EstablishmentsController , :create
    get "/establishments", EstablishmentsController , :index

  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: BackendWeb.Telemetry
    end
  end
end
