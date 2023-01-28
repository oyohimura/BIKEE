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

# Creating users

puts "Generating 4 example users..."
user = User.new(
  password: 'Bob123$',
  email: 'bob@gmail.com',
  first_name: 'Bob',
  last_name: 'Dupont',
  address: '57 Rue Auber, 14150 Ouistreham'
)
file = URI.open("https://img.huffingtonpost.com/asset/573cd81c1600002a00f93ce9.jpeg?ops=scalefit_720_noupscale")
user.avatar.attach(io: file, filename: "bob.jpeg", content_type: "image/jpeg")
user.save

user = User.new(
  password: 'Clara123$',
  email: 'clara@gmail.com',
  first_name: 'Clara',
  last_name: 'Moriconi',
  address: 'rue de la montage, 67210 Obernai'
)

file = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1663345881/yaxmecvbe7skaqrm4ziw.jpg")
user.avatar.attach(io: file, filename: "clara.jpg", content_type: "image/jpg")
user.save

user = User.new(
  password: 'Yamato123$',
  email: 'yamato@gmail.com',
  first_name: 'Yamato',
  last_name: 'Belhouchet',
  address: 'rue du Japon, Paris'
)

file = URI.open("https://avatars.githubusercontent.com/u/113622459?v=4")
user.avatar.attach(io: file, filename: "yamato.jpg", content_type: "image/jpg")
user.save

user = User.new(
  password: 'Arnaud123$',
  email: 'arnaud@gmail.com',
  first_name: 'Arnaud',
  last_name: 'Metral',
  address: 'rue de Brasilia, 72100 Le Mans'
)

file = URI.open("https://avatars.githubusercontent.com/u/111865610?v=4")
user.avatar.attach(io: file, filename: "arnaud.jpg", content_type: "image/jpg")
user.save

# Creating bikes

file = URI.open("https://cdn.shopify.com/s/files/1/0308/7024/1420/products/blue-R-1_870x580.jpg?v=1668396768")

bike1 = Bike.new(brand: "Decathlon", model: "Riverside", location: "Paris", price: 8, electric: true, user_id: 1)
bike1.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike1.user = User.where(first_name: 'Bob').first
bike1.save

puts "Generating first bike..."

file = URI.open("https://performancevelo.com/23264-superlarge_default/peugeot-lc01-d7.jpg")
bike2 = Bike.new(brand: "Peugeot", model: "T02", location: "Bordeaux", price: 10, electric: false, user_id: 1)
bike2.picture.attach(io: file, filename: "bike_peugeot.jpg", content_type: "image/jpg")
bike2.user = User.where(first_name: 'Arnaud').first
bike2.save

puts "Generating second bike..."

file = URI.open("https://static.cyclelab.eu/velos/trek/2007/highres/FX3Disc_22_35021_A_Primary.jpg")
bike3 = Bike.new(brand: "Trek", model: "FX 3", location: "Nantes", price: 5, electric: false, user_id: 1)
bike3.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike3.user = User.where(first_name: 'Clara').first
bike3.save

puts "Generating third bike..."

file = URI.open("https://m.media-amazon.com/images/I/71AgcYV8JBL._AC_SX679_.jpg")
bike4 = Bike.new(brand: "EDEN-BIKES", model: "Pat Patrouille 2", location: "Grasse", price: 16, electric: false, user_id: 1)
bike4.picture.attach(io: file, filename: "bike_pat_patrouille.jpg", content_type: "image/jpg")
bike4.user = User.where(first_name: 'Yamato').first
bike4.save

puts "Generating fourth bike..."

file = URI.open("https://le-velo-urbain.com/wp-content/uploads/2018/03/selection-photo-velo-insolite-original-5.jpg")
bike5 = Bike.new(brand: "Tordu", model: "Original model", location: "London", price: 36, electric: false, user_id: 1)
bike5.picture.attach(io: file, filename: "bike_original.jpg", content_type: "image/jpg")
bike5.user = User.where(first_name: 'Bob').first
bike5.save

puts "Generating fifth bike..."

file = URI.open("https://media.motoservices.com/media/cache/slider_lg/media/gallery/4520/Ryno-LeftRearAngle2-Rack.png")
bike5 = Bike.new(brand: "Rhino", model: "One-Wheel", location: "Strasbourg", price: 24, electric: true, user_id: 1)
bike5.picture.attach(io: file, filename: "bike_monocycle.jpg", content_type: "image/jpg")
bike5.user = User.where(first_name: 'Yamato').first
bike5.save

puts "Generating sixth bike..."

puts "Generating 2 example rents..."
rent = Rent.new(
  start_date: "2013-02-02 01:00:00 UTC",
  end_date: "2013-02-04 01:00:00 UTC",
  rent_price: 50.2
)
rent.user = User.where(first_name: 'Yamato').first
rent.bike = Bike.where(brand: 'Trek').first
rent.save

rent = Rent.new(
  start_date: "2014-02-02 01:00:00 UTC",
  end_date: "2014-02-04 01:00:00 UTC",
  rent_price: 50.2
)
rent.user = User.where(first_name: 'Clara').first
rent.bike = Bike.where(brand: 'EDEN-BIKES').first
rent.save

puts "Finished!"
