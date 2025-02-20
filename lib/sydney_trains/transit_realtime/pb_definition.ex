defmodule TransitRealtime.TrackDirection do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UP, 0
  field :DOWN, 1
end

defmodule TransitRealtime.FeedHeader.Incrementality do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :FULL_DATASET, 0
  field :DIFFERENTIAL, 1
end

defmodule TransitRealtime.TripUpdate.StopTimeUpdate.ScheduleRelationship do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SCHEDULED, 0
  field :SKIPPED, 1
  field :NO_DATA, 2
  field :UNSCHEDULED, 3
end

defmodule TransitRealtime.TripUpdate.StopTimeUpdate.OccupancyStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :EMPTY, 0
  field :MANY_SEATS_AVAILABLE, 1
  field :FEW_SEATS_AVAILABLE, 2
  field :STANDING_ROOM_ONLY, 3
  field :CRUSHED_STANDING_ROOM_ONLY, 4
  field :FULL, 5
  field :NOT_ACCEPTING_PASSENGERS, 6
end

defmodule TransitRealtime.VehiclePosition.VehicleStopStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :INCOMING_AT, 0
  field :STOPPED_AT, 1
  field :IN_TRANSIT_TO, 2
end

defmodule TransitRealtime.VehiclePosition.CongestionLevel do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UNKNOWN_CONGESTION_LEVEL, 0
  field :RUNNING_SMOOTHLY, 1
  field :STOP_AND_GO, 2
  field :CONGESTION, 3
  field :SEVERE_CONGESTION, 4
end

defmodule TransitRealtime.VehiclePosition.OccupancyStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :EMPTY, 0
  field :MANY_SEATS_AVAILABLE, 1
  field :FEW_SEATS_AVAILABLE, 2
  field :STANDING_ROOM_ONLY, 3
  field :CRUSHED_STANDING_ROOM_ONLY, 4
  field :FULL, 5
  field :NOT_ACCEPTING_PASSENGERS, 6
end

defmodule TransitRealtime.Alert.Cause do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UNKNOWN_CAUSE, 1
  field :OTHER_CAUSE, 2
  field :TECHNICAL_PROBLEM, 3
  field :STRIKE, 4
  field :DEMONSTRATION, 5
  field :ACCIDENT, 6
  field :HOLIDAY, 7
  field :WEATHER, 8
  field :MAINTENANCE, 9
  field :CONSTRUCTION, 10
  field :POLICE_ACTIVITY, 11
  field :MEDICAL_EMERGENCY, 12
end

defmodule TransitRealtime.Alert.Effect do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :NO_SERVICE, 1
  field :REDUCED_SERVICE, 2
  field :SIGNIFICANT_DELAYS, 3
  field :DETOUR, 4
  field :ADDITIONAL_SERVICE, 5
  field :MODIFIED_SERVICE, 6
  field :OTHER_EFFECT, 7
  field :UNKNOWN_EFFECT, 8
  field :STOP_MOVED, 9
  field :NO_EFFECT, 10
  field :ACCESSIBILITY_ISSUE, 11
end

defmodule TransitRealtime.Alert.SeverityLevel do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :UNKNOWN_SEVERITY, 1
  field :INFO, 2
  field :WARNING, 3
  field :SEVERE, 4
end

defmodule TransitRealtime.TripDescriptor.ScheduleRelationship do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :SCHEDULED, 0
  field :ADDED, 1
  field :UNSCHEDULED, 2
  field :CANCELED, 3
  field :REPLACEMENT, 5
end

defmodule TransitRealtime.CarriageDescriptor.OccupancyStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :EMPTY, 0
  field :MANY_SEATS_AVAILABLE, 1
  field :FEW_SEATS_AVAILABLE, 2
  field :STANDING_ROOM_ONLY, 3
  field :CRUSHED_STANDING_ROOM_ONLY, 4
  field :FULL, 5
end

defmodule TransitRealtime.CarriageDescriptor.ToiletStatus do
  @moduledoc false

  use Protobuf, enum: true, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :NONE, 0
  field :NORMAL, 1
  field :ACCESSIBLE, 2
end

defmodule TransitRealtime.FeedMessage do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :header, 1, required: true, type: TransitRealtime.FeedHeader
  field :entity, 2, repeated: true, type: TransitRealtime.FeedEntity

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.FeedHeader do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :gtfs_realtime_version, 1, required: true, type: :string

  field :incrementality, 2,
    optional: true,
    type: TransitRealtime.FeedHeader.Incrementality,
    default: :FULL_DATASET,
    enum: true

  field :timestamp, 3, optional: true, type: :uint64

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.FeedEntity do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, required: true, type: :string
  field :is_deleted, 2, optional: true, type: :bool, default: false
  field :trip_update, 3, optional: true, type: TransitRealtime.TripUpdate
  field :vehicle, 4, optional: true, type: TransitRealtime.VehiclePosition
  field :alert, 5, optional: true, type: TransitRealtime.Alert

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TripUpdate.StopTimeEvent do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :delay, 1, optional: true, type: :int32
  field :time, 2, optional: true, type: :int64
  field :uncertainty, 3, optional: true, type: :int32

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TripUpdate.StopTimeUpdate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :stop_sequence, 1, optional: true, type: :uint32
  field :stop_id, 4, optional: true, type: :string
  field :arrival, 2, optional: true, type: TransitRealtime.TripUpdate.StopTimeEvent
  field :departure, 3, optional: true, type: TransitRealtime.TripUpdate.StopTimeEvent

  field :schedule_relationship, 5,
    optional: true,
    type: TransitRealtime.TripUpdate.StopTimeUpdate.ScheduleRelationship,
    default: :SCHEDULED,
    enum: true

  field :departure_occupancy_status, 6,
    optional: true,
    type: TransitRealtime.TripUpdate.StopTimeUpdate.OccupancyStatus,
    enum: true

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TripUpdate do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trip, 1, required: true, type: TransitRealtime.TripDescriptor
  field :vehicle, 3, optional: true, type: TransitRealtime.VehicleDescriptor
  field :stop_time_update, 2, repeated: true, type: TransitRealtime.TripUpdate.StopTimeUpdate
  field :timestamp, 4, optional: true, type: :uint64
  field :delay, 5, optional: true, type: :int32

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.VehiclePosition do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trip, 1, optional: true, type: TransitRealtime.TripDescriptor
  field :vehicle, 8, optional: true, type: TransitRealtime.VehicleDescriptor
  field :position, 2, optional: true, type: TransitRealtime.Position
  field :current_stop_sequence, 3, optional: true, type: :uint32
  field :stop_id, 7, optional: true, type: :string

  field :current_status, 4,
    optional: true,
    type: TransitRealtime.VehiclePosition.VehicleStopStatus,
    default: :IN_TRANSIT_TO,
    enum: true

  field :timestamp, 5, optional: true, type: :uint64

  field :congestion_level, 6,
    optional: true,
    type: TransitRealtime.VehiclePosition.CongestionLevel,
    enum: true

  field :occupancy_status, 9,
    optional: true,
    type: TransitRealtime.VehiclePosition.OccupancyStatus,
    enum: true

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.Alert do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :active_period, 1, repeated: true, type: TransitRealtime.TimeRange
  field :informed_entity, 5, repeated: true, type: TransitRealtime.EntitySelector

  field :cause, 6,
    optional: true,
    type: TransitRealtime.Alert.Cause,
    default: :UNKNOWN_CAUSE,
    enum: true

  field :effect, 7,
    optional: true,
    type: TransitRealtime.Alert.Effect,
    default: :UNKNOWN_EFFECT,
    enum: true

  field :url, 8, optional: true, type: TransitRealtime.TranslatedString
  field :header_text, 10, optional: true, type: TransitRealtime.TranslatedString
  field :description_text, 11, optional: true, type: TransitRealtime.TranslatedString
  field :tts_header_text, 12, optional: true, type: TransitRealtime.TranslatedString
  field :tts_description_text, 13, optional: true, type: TransitRealtime.TranslatedString
  field :severity_level, 14, optional: true, type: TransitRealtime.Alert.SeverityLevel, enum: true

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.UpdateBundle do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :GTFSStaticBundle, 1, required: true, type: :string
  field :update_sequence, 2, required: true, type: :int32
  field :cancelled_trip, 4, repeated: true, type: :string
end

defmodule TransitRealtime.TimeRange do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :start, 1, optional: true, type: :uint64
  field :end, 2, optional: true, type: :uint64

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.Position do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :latitude, 1, required: true, type: :float
  field :longitude, 2, required: true, type: :float
  field :bearing, 3, optional: true, type: :float
  field :odometer, 4, optional: true, type: :double
  field :speed, 5, optional: true, type: :float

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TripDescriptor do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :trip_id, 1, optional: true, type: :string
  field :route_id, 5, optional: true, type: :string
  field :direction_id, 6, optional: true, type: :uint32
  field :start_time, 2, optional: true, type: :string
  field :start_date, 3, optional: true, type: :string

  field :schedule_relationship, 4,
    optional: true,
    type: TransitRealtime.TripDescriptor.ScheduleRelationship,
    enum: true

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.VehicleDescriptor do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :id, 1, optional: true, type: :string
  field :label, 2, optional: true, type: :string
  field :license_plate, 3, optional: true, type: :string

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TfnswVehicleDescriptor do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :air_conditioned, 1, optional: true, type: :bool, default: false
  field :wheelchair_accessible, 2, optional: true, type: :int32, default: 0
  field :vehicle_model, 3, optional: true, type: :string
  field :performing_prior_trip, 4, optional: true, type: :bool, default: false
  field :special_vehicle_attributes, 5, optional: true, type: :int32, default: 0
end

defmodule TransitRealtime.CarriageDescriptor do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :name, 1, optional: true, type: :string
  field :position_in_consist, 2, required: true, type: :int32

  field :occupancy_status, 3,
    optional: true,
    type: TransitRealtime.CarriageDescriptor.OccupancyStatus,
    enum: true

  field :quiet_carriage, 4, optional: true, type: :bool, default: false

  field :toilet, 5,
    optional: true,
    type: TransitRealtime.CarriageDescriptor.ToiletStatus,
    enum: true

  field :luggage_rack, 6, optional: true, type: :bool, default: false

  field :departure_occupancy_status, 7,
    optional: true,
    type: TransitRealtime.CarriageDescriptor.OccupancyStatus,
    enum: true

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.EntitySelector do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :agency_id, 1, optional: true, type: :string
  field :route_id, 2, optional: true, type: :string
  field :route_type, 3, optional: true, type: :int32
  field :trip, 4, optional: true, type: TransitRealtime.TripDescriptor
  field :stop_id, 5, optional: true, type: :string
  field :direction_id, 6, optional: true, type: :uint32

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TranslatedString.Translation do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :text, 1, required: true, type: :string
  field :language, 2, optional: true, type: :string

  extensions([{1000, 2000}])
end

defmodule TransitRealtime.TranslatedString do
  @moduledoc false

  use Protobuf, syntax: :proto2, protoc_gen_elixir_version: "0.13.0"

  field :translation, 1, repeated: true, type: TransitRealtime.TranslatedString.Translation

  extensions([{1000, 2000}])
end
