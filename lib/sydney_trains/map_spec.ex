defmodule SydneyTrains.MapSpec do
  alias MapLibre, as: Ml
  alias SydneyTrains.Api

  @sydney_coordinates {151.2093, -33.8688}

  def spec() do
    train_lines = load_train_lines()
    realtime_positions = load_realtime_positions()

    Ml.new(
      style: :street,
      zoom: 13,
      center: @sydney_coordinates
    )
    |> draw_t1_line(train_lines)
    |> draw_t2_line(train_lines)
    |> draw_t3_line(train_lines)
    |> draw_t4_line(train_lines)
    |> draw_t5_line(train_lines)
    |> draw_t7_line(train_lines)
    |> draw_t8_line(train_lines)
    |> draw_t9_line(train_lines)
    |> Ml.add_source(
      "realtime_positions",
      type: :geojson,
      data: realtime_positions
    )
    |> Ml.add_layer(
      id: "positions",
      type: :circle,
      source: "realtime_positions",
      paint: %{
        "circle-radius" => 8,
        "circle-color" => "#000000"
      }
    )
    |> Ml.to_spec()
  end

  def load_realtime_positions() do
    Api.get_vehicle_positions()
    |> Api.vehicle_positions_to_geojson()
  end

  def load_train_lines() do
    %{
      t1_north_shore_and_western_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T1-W-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t2_inner_west_and_leppington:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T2-sj2-1_1.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t3_bankstown_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T3-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t4_eastern_suburbs_and_illawarra_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T4-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t5_cumberland_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T5-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t7_olympic_park_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T7-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t8_airport_and_south_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T8-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!(),
      t9_northern_line:
        :code.priv_dir(:sydney_trains)
        |> Path.join("trainlines/x0001_2-T9-sj2-1_0.geojson")
        |> File.read!()
        |> Jason.decode!()
    }
  end

  def draw_t1_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t1_north_shore_and_western_line",
      type: :geojson,
      data: train_lines.t1_north_shore_and_western_line
    )
    |> Ml.add_layer(
      id: "t1_north_shore_and_western_line",
      type: :line,
      source: "t1_north_shore_and_western_line",
      paint: %{
        "line-color" => "#F99D1C",
        "line-width" => 2.0
      }
    )
  end

  def draw_t2_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t2_inner_west_and_leppington",
      type: :geojson,
      data: train_lines.t2_inner_west_and_leppington
    )
    |> Ml.add_layer(
      id: "t2_inner_west_and_leppington",
      type: :line,
      source: "t2_inner_west_and_leppington",
      paint: %{
        "line-color" => "#0098CD",
        "line-width" => 2.0
      }
    )
  end

  def draw_t3_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t3_bankstown_line",
      type: :geojson,
      data: train_lines.t3_bankstown_line
    )
    |> Ml.add_layer(
      id: "t3_bankstown_line",
      type: :line,
      source: "t3_bankstown_line",
      paint: %{
        "line-color" => "#F6891F",
        "line-width" => 2.0
      }
    )
  end

  def draw_t4_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t4_eastern_suburbs_and_illawarra_line",
      type: :geojson,
      data: train_lines.t4_eastern_suburbs_and_illawarra_line
    )
    |> Ml.add_layer(
      id: "t4_eastern_suburbs_and_illawarra_line",
      type: :line,
      source: "t4_eastern_suburbs_and_illawarra_line",
      paint: %{
        "line-color" => "#005AA3",
        "line-width" => 2.0
      }
    )
  end

  def draw_t5_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t5_cumberland_line",
      type: :geojson,
      data: train_lines.t5_cumberland_line
    )
    |> Ml.add_layer(
      id: "t5_cumberland_line",
      type: :line,
      source: "t5_cumberland_line",
      paint: %{
        "line-color" => "#C4258F",
        "line-width" => 2.0
      }
    )
  end

  def draw_t7_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t7_olympic_park_line",
      type: :geojson,
      data: train_lines.t7_olympic_park_line
    )
    |> Ml.add_layer(
      id: "t7_olympic_park_line",
      type: :line,
      source: "t7_olympic_park_line",
      paint: %{
        "line-color" => "#6F818E",
        "line-width" => 2.0
      }
    )
  end

  def draw_t8_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t8_airport_and_south_line",
      type: :geojson,
      data: train_lines.t8_airport_and_south_line
    )
    |> Ml.add_layer(
      id: "t8_airport_and_south_line",
      type: :line,
      source: "t8_airport_and_south_line",
      paint: %{
        "line-color" => "#00954C",
        "line-width" => 2.0
      }
    )
  end

  def draw_t9_line(map, train_lines) do
    map
    |> Ml.add_source(
      "t9_northern_line",
      type: :geojson,
      data: train_lines.t9_northern_line
    )
    |> Ml.add_layer(
      id: "t9_northern_line",
      type: :line,
      source: "t9_northern_line",
      paint: %{
        "line-color" => "#D11F2F",
        "line-width" => 2.0
      }
    )
  end
end
