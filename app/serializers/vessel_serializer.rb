class VesselSerializer < ActiveModel::Serializer
  attributes :id, :destination, :naccs_code, :name, :start_location, :ship_type, :owner_id

  has_many :vessel_trackings, serializer: VesselTrackingSerializer
end
