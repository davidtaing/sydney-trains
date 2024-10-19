defmodule SydneyTrains.RealtimePositions do
  use GenServer
  alias Phoenix.PubSub
  alias SydneyTrains.Api

  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_update()
    {:ok, state}
  end

  def subscribe() do
    PubSub.subscribe(SydneyTrains.PubSub, "realtime_positions")
  end

  def handle_info(:update, _params) do
    Api.get_vehicle_positions()
    |> Api.vehicle_positions_to_geojson()
    |> then(fn geojson ->
      PubSub.broadcast(
        SydneyTrains.PubSub,
        "realtime_positions",
        {:realtime_positions_updated,
         %{
           updated_at: DateTime.utc_now(),
           geojson: geojson
         }}
      )
    end)

    {:noreply, %{}}
  end

  defp schedule_update do
    {:ok, _timer} = :timer.send_interval(5000, self(), :update)
  end
end
