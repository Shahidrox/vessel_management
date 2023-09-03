module API
  module V1
    class Base < Grape::API
      format :json
      version :v1

      mount Vessels
      mount VesselTrackings
    end
  end
end
