defmodule SydneyTrains.MapSpec do
  alias MapLibre, as: Ml

  def spec() do
    Ml.new(
      style: :street,
      zoom: 13,
      center: {151.2093, -33.8688}
    )
    |> Ml.to_spec()
  end
end
