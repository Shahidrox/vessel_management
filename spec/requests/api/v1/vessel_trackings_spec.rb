require 'rails_helper'

RSpec.describe "Api::V1::VesselTrackings", type: :request do
  before do
    @vessel  = Vessel.create(
      name: Faker::Ancient.titan,
      owner_id: Faker::IDNumber.croatian_id(international: true),
      naccs_code: Faker::Barcode.upc_e,
      start_location: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      destination: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      ship_type: rand(5)
    )
    VesselTracking.create(vessel: @vessel, eta: Time.current + 2.days, next_port: Faker::Kpop.solo, speed: "#{rand(50)} KM/H")
  end

  describe "API test" do
    it "Fetch specific vessel tracking" do
      get '/v1/vessel_trackings',
        :params => {vessel_id: @vessel.id}
      expect(response.status).to eq(200)
    end

    it "Add new vessel tracking" do
      post '/v1/vessel_trackings/create',
      :params => {
        vessel_id: @vessel.id,
        eta: Time.current + 1.day,
        next_port: Faker::Kpop.solo,
        speed: "#{rand(50)} KM/H"
      }
      expect(response.status).to eq(200)
    end

    it "update vessel trackings" do
      vt = VesselTracking.first
      put "/v1/vessel_trackings/update",
        :params => { id: vt.id, speed: "#{rand(100)} KM/H" }
      expect(response.status).to eq(200)
    end

    it "delete vessel trackings" do
      vt = VesselTracking.first
      delete "/v1/vessel_trackings/destroy", :params => {id: vt.id}
      expect(response.status).to eq(200)
    end
  end
end
