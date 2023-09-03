module API
  module V1
    class Vessels < Grape::API
      desc 'Fetch all vessels'
      get '/vessels' do
        vessels = Vessel.all

        ActiveModel::Serializer::CollectionSerializer.new(vessels, serializer: VesselSerializer)
      end

      desc 'Fetch vessel detail'
      params do
        requires :id, type: Integer, desc: 'ID'
      end

      get '/vessels/show' do
        vessel = Vessel.where(id: params[:id])

        return error!('record is not availabl', 404) if vessel.nil?

        ActiveModel::Serializer::CollectionSerializer.new(vessel, serializer: VesselSerializer)
      end

      desc 'Add new vessel'
      params do
        requires :name, type: String, desc: 'name'
        requires :owner_id, type: String, desc: 'owner'
        requires :naccs_code, type: String, desc: 'naccs_code'
        requires :start_location, type: String, desc: 'start_location'
        requires :destination, type: String, desc: 'destination'
        requires :ship_type, type: String, desc: "ship_type: #{Vessel.ship_types.keys}"
      end

      post '/vessels/create' do
        vessel = Vessel.new(params)
        if vessel.save
          status 200
        else
          error!(vessel.errors.full_messages.join(', '), 422)
        end
      end

      desc 'update vessel'
      params do
        requires :id, type: Integer, desc: 'ID'
        optional :name, type: String, desc: 'name'
        optional :owner_id, type: String, desc: 'owner'
        optional :naccs_code, type: String, desc: 'naccs_code'
        optional :start_location, type: String, desc: 'start_location'
        optional :destination, type: String, desc: 'destination'
        optional :ship_type, type: String, desc: "ship_type: #{Vessel.ship_types.keys}"
      end

      put '/vessels/update' do
        vessel = Vessel.find(params[:id])
        if vessel.update(params)
          status 200
        else
          error!(vessel.errors.full_messages.join(', '), 422)
        end
      end

      desc 'delete vessel '
      params do
        requires :id, type: Integer, desc: 'ID'
      end

      delete '/vessels/destroy' do
        vessel = Vessel.find_by(id: params[:id])

        return error!('record is not availabl', 404) if vessel.nil?

        if vessel.destroy
          status 200
        else
          error!(vessel.errors.full_messages.join(', '), 422)
        end
      end
    end
  end
end
