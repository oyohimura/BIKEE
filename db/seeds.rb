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

bike1 = Bike.new(brand: "Decathlon", model: "Riverside", location: "Paris", price: 8, electric: true, user_id: 1,
description: "My beautiful all-terrain bike is the perfect companion for all of my adventures. Whether I'm hitting the trails or exploring back roads, this bike can handle anything. With its durable frame and sturdy tires, I never have to worry about getting stuck or having to turn back. And the smooth ride it provides makes every journey a joy. I am so lucky to have this bike and all the wonderful experiences it has taken me on.")
bike1.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike1.user = User.where(first_name: 'Bob').first
bike1.save

puts "Generating first bike..."

file = URI.open("https://performancevelo.com/23264-superlarge_default/peugeot-lc01-d7.jpg")
bike2 = Bike.new(brand: "Peugeot", model: "T02", location: "Bordeaux", price: 10, electric: false, user_id: 1,
description: "My old Peugeot bike may have seen better days, but thanks to a recent renovation, it's better than ever. The classic frame and vintage design have been restored to their former glory, giving the bike a unique and timeless look. The new gears and brakes ensure a smooth and reliable ride, while the updated tires provide excellent traction on any terrain. I love taking my renewed Peugeot out for a spin and feeling the wind in my hair as I pedal down the road. It's not just a mode of transportation, it's a piece of history and a true treasure.")
bike2.picture.attach(io: file, filename: "bike_peugeot.jpg", content_type: "image/jpg")
bike2.user = User.where(first_name: 'Arnaud').first
bike2.save

puts "Generating second bike..."

file = URI.open("https://static.cyclelab.eu/velos/trek/2007/highres/FX3Disc_22_35021_A_Primary.jpg")
bike3 = Bike.new(brand: "Trek", model: "FX 3", location: "Nantes", price: 5, electric: false, user_id: 1,
description: "My new Trek bike is the ultimate rental for any cycling enthusiast. With its lightweight frame and advanced suspension system, this bike provides a smooth and comfortable ride on any terrain. The powerful brakes and responsive gears make it easy to navigate even the steepest hills and the most challenging trails. The sleek design and high-quality components give it a professional look and feel. Whether I'm exploring the city or hitting the mountains, this bike is the perfect choice for any adventure. I am so excited to take it out and see what it can do!")
bike3.picture.attach(io: file, filename: "bike_decathlon.jpg", content_type: "image/jpg")
bike3.user = User.where(first_name: 'Clara').first
bike3.save

puts "Generating third bike..."

file = URI.open("https://m.media-amazon.com/images/I/71AgcYV8JBL._AC_SX679_.jpg")
bike4 = Bike.new(brand: "EDEN-BIKES", model: "Pat Patrouille 2", location: "Grasse", price: 16, electric: false, user_id: 1,
description: "My kid's 'Pat Patrouille' bike is the perfect choice for any young adventurer. The colorful design featuring characters from the popular cartoon series 'Pat Patrouille' is sure to delight any child and make them feel like they are part of their favorite show. The sturdy frame and safe, easy-to-use brakes make it a great choice for learning to ride. The adjustable seat and handlebars allow the bike to grow with your child, ensuring it will be a reliable and fun mode of transportation for years to come. I am happy to see my kid having fun and safe with 'Pat Patrouille' bike.")
bike4.picture.attach(io: file, filename: "bike_pat_patrouille.jpg", content_type: "image/jpg")
bike4.user = User.where(first_name: 'Yamato').first
bike4.save

puts "Generating fourth bike..."

file = URI.open("https://le-velo-urbain.com/wp-content/uploads/2018/03/selection-photo-velo-insolite-original-5.jpg")
bike5 = Bike.new(brand: "Tordu", model: "Original model", location: "London", price: 36, electric: false, user_id: 1,
description: "My weird bike is truly one-of-a-kind. Instead of sitting on a seat and pedaling with your legs, you actually lie on your stomach and pedal with your hands. This unique design allows for an entirely new riding experience, giving you a low-to-the-ground perspective and a full-body workout. The sturdy frame and large wheels make it easy to maneuver and stable to ride. It's definitely not your average bike and it's sure to turn heads. It's perfect for those looking for something different, fun, and challenging. I enjoy riding my weird bike and it's a great way to mix up my workout routine.")
bike5.picture.attach(io: file, filename: "bike_original.jpg", content_type: "image/jpg")
bike5.user = User.where(first_name: 'Bob').first
bike5.save

puts "Generating fifth bike..."

file = URI.open("https://media.motoservices.com/media/cache/slider_lg/media/gallery/4520/Ryno-LeftRearAngle2-Rack.png")
bike5 = Bike.new(brand: "Rhino", model: "One-Wheel", location: "Strasbourg", price: 24, electric: true, user_id: 1,
description: "My electric one-wheel is a cutting-edge mode of transportation that combines the convenience of an electric bike with the thrill of a unicycle. The compact design makes it easy to navigate through tight spaces and the powerful electric motor provides a boost of speed when needed. With its advanced gyroscopic stabilization and intuitive controls, riding the one-wheel is surprisingly easy, even for beginners. The long-lasting battery ensures a stable and long-lasting ride. The one-wheel is a perfect solution for urban commuters or people who want to try something new and exciting. I love the feeling of freedom and control that this bike gives me as I zip through the streets.")
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
