module API
  module V1
    class VesselTrackings < Grape::API

      desc 'Fetch specific vessel tracking'
      params do
        requires :vessel_id, type: Integer, desc: 'vessel_id'
      end
      get '/vessel_trackings' do
        vt = VesselTracking.where(vessel_id: params[:vessel_id])

        ActiveModel::Serializer::CollectionSerializer.new(vt, serializer: VesselTrackingSerializer)
      end

      desc 'Add new vessel tracking'
      params do
        requires :vessel_id, type: Integer, desc: 'vessel_id'
        requires :eta, type: String, desc: 'estimated time of arrival'
        requires :next_port, type: String, desc: 'next_port'
        requires :speed, type: String, desc: 'speed'
      end

      post '/vessel_trackings/create' do
        vt = VesselTracking.new(params)
        if vt.save
          status 200
        else
          error!(vt.errors.full_messages.join(', '), 422)
        end
      end

      desc 'update vessel trackings'
      params do
        requires :id, type: Integer, desc: 'ID'
        optional :eta, type: String, desc: 'estimated time of arrival'
        optional :next_port, type: String, desc: 'next_port'
        optional :speed, type: String, desc: 'speed'
      end

      put '/vessel_trackings/update' do
        vt = VesselTracking.find(params[:id])
        if vt.update(params)
          status 200
        else
          error!(vt.errors.full_messages.join(', '), 422)
        end
      end

      desc 'delete vessel trackings'
      params do
        requires :id, type: Integer, desc: 'ID'
      end

      delete '/vessel_trackings/destroy' do
        vt = VesselTracking.find_by(id: params[:id])

        return error!('record is not availabl', 404) if vt.nil?

        if vt.destroy
          status 200
        else
          error!(vt.errors.full_messages.join(', '), 422)
        end
      end
    end
  end
end
