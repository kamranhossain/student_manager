defmodule StudentManager.Accounts.User do
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

  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> cast(attrs, [:roles])
    |> validate_inclusion(:roles, ~w(student teacher))
  end

  def teacher_registration_changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> changeset(attrs)
    |> change(%{roles: ["teacher"]})
  end

  def student_registration_changeset(user_or_changeset, attrs) do
    user_or_changeset
    |> changeset(attrs)
    |> change(%{roles: ["student"]})
  end
end
