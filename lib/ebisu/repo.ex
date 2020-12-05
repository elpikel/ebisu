defmodule Ebisu.Repo do
  use Ecto.Repo,
    otp_app: :ebisu,
    adapter: Ecto.Adapters.Postgres
end
