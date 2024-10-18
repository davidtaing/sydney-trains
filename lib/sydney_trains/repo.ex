defmodule SydneyTrains.Repo do
  use Ecto.Repo,
    otp_app: :sydney_trains,
    adapter: Ecto.Adapters.SQLite3
end
