defmodule SydneyTrainsWeb.Live.Map do
  use SydneyTrainsWeb, :live_view
  alias SydneyTrains.MapSpec
  alias SydneyTrains.RealtimePositions

  @impl true
  def mount(_params, _session, socket) do
    if connected?(socket) do
      RealtimePositions.subscribe()
    end

    map_spec = MapSpec.spec()

    socket =
      socket
      |> assign(:id, socket.id)
      |> assign(:map_spec, MapSpec.spec())

    {:ok,
     push_event(socket, "map:#{socket.id}:init", %{
       "spec" => map_spec
     })}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="h-full w-full">
      <div id="map" phx-hook="Map" phx-update="ignore" data-id={@id} class="min-h-screen" />
    </div>
    """
  end

  @impl true
  def handle_info(
        {:realtime_positions_updated, %{geojson: geojson, updated_at: updated_at}},
        socket
      ) do
    socket =
      socket
      |> assign(:updated_at, updated_at)
      |> push_event("map:#{socket.id}:positions_updated", %{
        "geojson" => geojson
      })

    {:noreply, socket}
  end
end
