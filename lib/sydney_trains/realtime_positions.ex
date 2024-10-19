defmodule SydneyTrains.RealtimePositions do
  use GenServer
  alias Phoenix.PubSub

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
    Logger.info("HELLO WORLD")
    {:noreply, %{}}
  end

  defp schedule_update do
    {:ok, _timer} = :timer.send_interval(5000, self(), :update)
  end
end
