defmodule SydneyTrains.Api do
  def get_vehicle_positions() do
    resp =
      Req.new(
        base_url: "https://api.transport.nsw.gov.au/v2/gtfs/vehiclepos",
        headers: [
          Authorization: "apikey #{Application.fetch_env!(:sydney_trains, :tfnsw_api_key)}"
        ]
      )
      |> Req.get!(url: "/sydneytrains")

    raw_body = resp.body

    Protobuf.decode(raw_body, TransitRealtime.FeedMessage)
  end

  def vehicle_positions_to_geojson(resp_body) do
    resp_body.entity
    |> Enum.map(fn item ->
      pos = item.vehicle.position

      %Geo.Point{
        coordinates: {pos.longitude, pos.latitude},
        srid: nil
        # properties: item.vehicle
      }
    end)
    |> Enum.map(fn item ->
      item
      |> Geo.JSON.encode!()
      |> then(
        &%{
          "type" => "Feature",
          "geometry" => &1,
          "properties" => %{}
        }
      )
    end)
    |> then(
      &%{
        "type" => "FeatureCollection",
        "features" => &1
      }
    )
  end
end
