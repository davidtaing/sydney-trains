defmodule TransitRealtime.PbExtension do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.13.0"

  extend(TransitRealtime.FeedEntity, :update, 1007,
    optional: true,
    type: TransitRealtime.UpdateBundle
  )

  extend(TransitRealtime.VehiclePosition, :consist, 1007,
    repeated: true,
    type: TransitRealtime.CarriageDescriptor
  )

  extend(TransitRealtime.Position, :track_direction, 1007,
    optional: true,
    type: TransitRealtime.TrackDirection,
    enum: true
  )

  extend(TransitRealtime.VehicleDescriptor, :tfnsw_vehicle_descriptor, 1007,
    optional: true,
    type: TransitRealtime.TfnswVehicleDescriptor
  )

  extend(TransitRealtime.TripUpdate.StopTimeUpdate, :carriage_seq_predictive_occupancy, 1007,
    repeated: true,
    type: TransitRealtime.CarriageDescriptor
  )
end
