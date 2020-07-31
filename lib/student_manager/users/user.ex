defmodule StudentManager.Users.User do
  @moduledoc """
  User Schema
  """

  use Ecto.Schema
  use Pow.Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field(:roles, {:array, :string}, default: ["student"])

    pow_user_fields()

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> pow_changeset(attrs)
    |> cast(attrs, [])
    |> validate_required([])
  end

end
