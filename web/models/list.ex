defmodule PhoenixTrello.List do
  use PhoenixTrello.Web, :model

  alias PhoenixTrello.{Board, Repo, Card}

  @derive {Jason.Encoder, only: [:id, :name, :position, :cards]}
  schema "lists" do
    field :name, :string
    field :position, :integer

    belongs_to :board, Board
    has_many :cards, Card

    timestamps()
  end

  @required_fields ~w(name)a
  @optional_fields ~w(position)a

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params,  List.flatten(@required_fields, @optional_fields))
    |> validate_required(@required_fields)
    |> calculate_position()
  end

  def update_changeset(model, params \\ %{}) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_required(@required_fields)
  end

  defp calculate_position(current_changeset) do
    model = current_changeset.data

    query = from(l in PhoenixTrello.List,
            select: l.position,
            where: l.board_id == ^(model.board_id),
            order_by: [desc: l.position],
            limit: 1)

    case Repo.one(query) do
      nil      -> put_change(current_changeset, :position, 1024)
      position -> put_change(current_changeset, :position, position + 1024)
    end
  end
end
