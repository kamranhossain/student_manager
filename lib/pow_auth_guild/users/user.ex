defmodule PowAuthGuild.Users.User do
  @moduledoc """
  User Schema
  """

  use Ecto.Schema
  use Pow.Ecto.Schema

  schema "users" do
    pow_user_fields()

    timestamps()
  end
end
