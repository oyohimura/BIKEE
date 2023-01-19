# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Rent.destroy_all
Bike.destroy_all
User.destroy_all

puts "Destroying database!"

puts "Generating example user..."
user = User.new(
  password: 'Bob123$',
  email: 'bob@gmail.com',
  first_name: 'Bob',
  last_name: 'Dupont',
  address: 'rue de la mer, Paris'
)
user.save!

user = User.new(
  password: 'Clara123$',
  email: 'clara@gmail.com',
  first_name: 'Clara',
  last_name: 'Moriconi',
  address: 'rue de la montagne, Pyrenees'
)
user.save!

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")

bike1 = Bike.new(brand: "Decathlon", model: "Riverside", location: "Paris", user_id: 1, price: 8, electric: true)
bike1.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike1.user = User.first
bike1.save!

puts "Generating first bike..."

file = URI.open("https://performancevelo.com/23264-superlarge_default/peugeot-lc01-d7.jpg")
bike2 = Bike.new(brand: "Peugeot", model: "T02", location: "Bordeaux", user_id: 1, price: 10, electric: false)
bike2.picture.attach(io: file, filename: "bike_peugeot.jpg", content_type: "image/jpg")
bike2.user = User.first
bike2.save!

puts "Generating second bike..."

file = URI.open("https://static.cyclelab.eu/velos/trek/2007/highres/FX3Disc_22_35021_A_Primary.jpg")
bike3 = Bike.new(brand: "Trek", model: "FX 3", location: "Nantes", user_id: 1, price: 5, electric: false)
bike3.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike3.user = User.last
bike3.save!

puts "Generating third bike..."

puts "Generating example rent..."
rent = Rent.new(
  start_date: "2013-02-02 01:00:00 UTC",
  end_date: "2013-02-04 01:00:00 UTC",
  rent_price: 50.2,
  status: 'confirmed'
)
rent.user = User.first
rent.bike = Bike.last
rent.save!

rent = Rent.new(
  start_date: "2014-02-02 01:00:00 UTC",
  end_date: "2014-02-04 01:00:00 UTC",
  rent_price: 50.2,
  status: 'confirmed'
)
rent.user = User.last
rent.bike = Bike.first
rent.save!

puts "Finished!"
