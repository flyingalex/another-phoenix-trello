defmodule PhoenixTrello.UserSocket do
  use Phoenix.Socket

  alias PhoenixTrello.{GuardianSerializer}
  alias Guardian.Phoenix.Socket

  # Channels
  channel "boards:*", PhoenixTrello.BoardChannel
  channel "users:*", PhoenixTrello.UserChannel

  # Transports
  # transport :websocket, Phoenix.Transports.WebSocket
  # transport :longpoll, Phoenix.Transports.LongPoll

  def connect(%{"token" => token}, socket) do
    case Socket.authenticate(socket, GuardianSerializer, token) do
      {:ok, authed_socket} ->
        {:ok, assign(socket, :current_user, Socket.current_resource(authed_socket))}
      {:error, _} -> :error
    end
    # case  Guardian.decode_and_verify(__MODULE__, token) do
    #   {:ok, claims} ->
    #     case GuardianSerializer.subject_for_token(claims["sub"]) do
    #       {:ok, user} ->
    #         {:ok, assign(socket, :current_user, user)}
    #       {:error, _reason} ->
    #         :error
    #     end
    #   {:error, _reason} ->
    #     :error
    # end
  end

  def connect(_params, _socket), do: :error

  def id(socket) do
    "users_socket:#{socket.assigns.current_user.id}"
  end
end
