# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Bike.destroy_all


Bike.create!(brand: "Decathlon", model: "Riverside", location: "Paris", user_id: 1, price: 8, electric: true)
Bike.create!(brand: "Peugeot", model: "T02", location: "Bordeaux", user_id: 1, price: 10, electric: false)
Bike.create!(brand: "Trek", model: "FX 3", location: "Nantes", user_id: 1, price: 5, electric: false)
