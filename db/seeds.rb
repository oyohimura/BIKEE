# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Bike.destroy_all

puts "Destroying database!"

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")

bike1 = Bike.new(brand: "Decathlon", model: "Riverside", location: "Paris", user_id: 1, price: 8, electric: true)
bike1.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike1.save!

puts "Generating first bike..."

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")
bike2 = Bike.new(brand: "Peugeot", model: "T02", location: "Bordeaux", user_id: 1, price: 10, electric: false)
bike2.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike2.save!

puts "Generating second bike..."

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")
bike3 = Bike.new(brand: "Trek", model: "FX 3", location: "Nantes", user_id: 1, price: 5, electric: false)
bike3.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike3.save!

puts "Generating third bike..."

puts "Finished!"
