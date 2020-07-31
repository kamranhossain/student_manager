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
end
