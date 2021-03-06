defmodule PhoenixTrello.UserBoard do
  use PhoenixTrello.Web, :model

  alias __MODULE__
  alias PhoenixTrello.{User, Board}


  @derive {Jason.Encoder, only: [:id, :user_id, :board_id]}
  schema "user_boards" do
    belongs_to :user, User
    belongs_to :board, Board

    timestamps()
  end

  @required_fields ~w(user_id board_id)a
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
    |> unique_constraint(:user_id, name: :user_boards_user_id_board_id_index)
  end

  def find_by_user_and_board(query \\ %UserBoard{}, user_id, board_id) do
    from u in query,
    where: u.user_id == ^user_id and u.board_id == ^board_id
  end
end
