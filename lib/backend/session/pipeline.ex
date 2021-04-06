defmodule Backend.Session.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :Agile,
  module: Backend.Guardian,
  error_handler:  Backend.Session.ErrorHandler

  plug Guardian.Plug.VerifyHeader, claims: %{typ: "access"}
  plug Guardian.Plug.VerifySession, claims: %{typ: "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
end
