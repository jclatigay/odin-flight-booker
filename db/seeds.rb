# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.create(code: "SFO")
Airport.create(code: "NYC")
Airport.create(code: "LAX")
Airport.create(code: "ATL")
Airport.create(code: "PHL")
Airport.create(code: "JPN")

Flight.create(
  departure_airport_id: Airport.find_by(code: "PHL").id,
  arrival_airport_id: Airport.find_by(code: "JPN").id,
  start: "2025-06-28 05:00:00",
  duration: 210
)

Flight.create(
  departure_airport_id: Airport.find_by(code: "SFO").id,
  arrival_airport_id: Airport.find_by(code: "NYC").id,
  start: "2024-11-25 08:00:00",
  duration: 360
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "NYC").id,
  arrival_airport_id: Airport.find_by(code: "LAX").id,
  start: "2024-11-26 10:00:00",
  duration: 400
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "ATL").id,
  arrival_airport_id: Airport.find_by(code: "SFO").id,
  start: "2024-11-27 14:00:00",
  duration: 300
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "LAX").id,
  arrival_airport_id: Airport.find_by(code: "ATL").id,
  start: "2024-11-28 16:00:00",
  duration: 420
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "SFO").id,
  arrival_airport_id: Airport.find_by(code: "NYC").id,
  start: "2024-11-29 18:00:00",
  duration: 360
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "NYC").id,
  arrival_airport_id: Airport.find_by(code: "LAX").id,
  start: "2024-11-30 20:00:00",
  duration: 400
)
Flight.create(
  departure_airport_id: Airport.find_by(code: "ATL").id,
  arrival_airport_id: Airport.find_by(code: "SFO").id,
  start: "2024-12-01 22:00:00",
  duration: 300
)
