defmodule PhoenixTrello.SessionController do
  use PhoenixTrello.Web, :controller

  plug :scrub_params, "session" when action in [:create]

  def create(conn, %{"session" => session_params}) do
    case PhoenixTrello.Session.authenticate(session_params) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> PhoenixTrello.GuardianSerializer.encode_and_sign()

        conn
        |> put_status(:created)
        |> render("show.json", jwt: jwt, user: user)

      :error ->
        conn
        |> put_status(:unprocessable_entity)
        |> render("error.json")
    end
  end

  def delete(conn, _) do
    conn
      |> PhoenixTrello.GuardianSerializer.Plug.current_token()
      |> PhoenixTrello.GuardianSerializer.revoke()

    conn
      |> render("delete.json")
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:forbidden)
    |> render(PhoenixTrello.SessionView, "forbidden.json", error: "Not Authenticated")
  end
end
