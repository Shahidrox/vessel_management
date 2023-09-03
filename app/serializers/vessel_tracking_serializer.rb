class VesselTrackingSerializer < ActiveModel::Serializer
  attributes :id, :eta, :next_port, :speed
end