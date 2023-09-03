# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do
  v = Vessel.new(
    name: Faker::Ancient.titan,
    owner_id: Faker::IDNumber.croatian_id(international: true),
    naccs_code: Faker::Barcode.upc_e,
    start_location: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
    destination: Faker::Travel::Airport.iata(size: 'large', region: 'united_states'),
    ship_type: rand(5)
  )
  v.vessel_trackings.build(
    eta: Time.current + 2.days,
    next_port: Faker::Kpop.solo,
    speed: "#{rand(50)} KM/H")
  v.save
end