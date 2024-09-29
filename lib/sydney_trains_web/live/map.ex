defmodule SydneyTrainsWeb.Live.Map do
  use SydneyTrainsWeb, :live_view
  alias SydneyTrains.MapSpec

  @impl true
  def mount(_params, _session, socket) do
    map_spec = MapSpec.spec()

    socket =
      socket
      |> assign(:id, socket.id)
      |> assign(:map_spec, map_spec)

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
end
