defmodule PhoenixTrello.GuardianSerializer do
  use Guardian, otp_app: :phoenix_trello

  alias PhoenixTrello.{Repo, User}

  def subject_for_token(user = %User{}, _claims), do: { :ok, to_string(user.id) }
  def subject_for_token(_, _claims), do: { :error, "Unknown resource type" }

  def resource_from_claims(%{"sub" => id}), do: { :ok, Repo.get(User, String.to_integer(id)) }
  def resource_from_claims(_), do: { :error, "Unknown resource type" }
end
