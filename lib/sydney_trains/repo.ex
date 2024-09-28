defmodule SydneyTrains.Repo do
  use Ecto.Repo,
    otp_app: :sydney_trains,
    adapter: Ecto.Adapters.Postgres
end
