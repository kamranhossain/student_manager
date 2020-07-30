defmodule StudentManager.Repo do
  use Ecto.Repo,
    otp_app: :student_manager,
    adapter: Ecto.Adapters.Postgres
end
