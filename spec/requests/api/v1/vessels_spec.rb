require 'rails_helper'

RSpec.describe "Api::V1::Vessels", type: :request do
  before do
    @vessel  = Vessel.create(
      name: Faker::Ancient.titan,
      owner_id: Faker::IDNumber.croatian_id(international: true),
      naccs_code: Faker::Barcode.upc_e,
      start_location: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      destination: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      ship_type: rand(5)
    )
    @vessel1 = Vessel.create(
      name: Faker::Ancient.titan,
      owner_id: Faker::IDNumber.croatian_id(international: true),
      naccs_code: Faker::Barcode.upc_e,
      start_location: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      destination: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
      ship_type: rand(5)
    )
  end

  describe "API test" do
    it "Create a new vessel" do
      v_count = Vessel.all.count
      post '/v1/vessels/create',
        :params => {
          name: Faker::Ancient.titan,
          owner_id: Faker::IDNumber.croatian_id(international: true),
          naccs_code: Faker::Barcode.upc_e,
          start_location: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
          destination: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
          ship_type: 'container_ships'
        }
      expect(response.status).to eq(200)
      expect(Vessel.count).to eq(v_count + 1)
    end

    it "fetch all vessels" do
      get '/v1/vessels'
      expect(response.status).to eq(200)
    end

    it "vessel detail" do
      get "/v1/vessels/show", :params => {id: @vessel.id}
      expect(response.status).to eq(200)
    end

    it "Update vessel" do
      get "/v1/vessels/show", :params => {id: @vessel.id}
      expect(response.status).to eq(200)
    end

    it "DELETE vessel" do
      delete "/v1/vessels/destroy", :params => {id: @vessel.id}
      expect(response.status).to eq(200)
    end
  end
end
