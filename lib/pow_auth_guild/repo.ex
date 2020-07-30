defmodule PowAuthGuild.Repo do
  use Ecto.Repo,
    otp_app: :pow_auth_guild,
    adapter: Ecto.Adapters.Postgres
end
