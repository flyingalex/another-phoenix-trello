defmodule PhoenixTrello.Comment do
  use PhoenixTrello.Web, :model

  @derive {Jason.Encoder, only: [:id, :text, :user, :inserted_at]}
  schema "comments" do
    field :text, :string

    belongs_to :user, PhoenixTrello.User
    belongs_to :card, PhoenixTrello.Card

    timestamps()
  end

  @required_fields ~w(user_id card_id text)a
  @optional_fields ~w()a

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, List.flatten(@required_fields, @optional_fields))
    |> validate_required(@required_fields)
  end
end
