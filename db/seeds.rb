# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
puts "Destroying all"
Complaint.destroy_all
User.destroy_all
Category.destroy_all
City.destroy_all
User.destroy_all


puts "Creating seeds"

User.create!(first_name: "Inês", last_name: "Marmelo", email: "fines.c.marmelo@gmail.com", password: "123456")

Category.create!(name: 'Abandoned Vehicles')
Category.create!(name: 'Bus Stops')
Category.create!(name: 'Car Parking')
Category.create!(name: 'Dog Fouling')
Category.create!(name: 'Flyposting')
Category.create!(name: 'Graffiti')
Category.create!(name: 'Park/Landscapes')
Category.create!(name: 'Pavements')
Category.create!(name: 'Potholes')
Category.create!(name: 'Public Toilets')
Category.create!(name: 'Road Traffic Signs')
Category.create!(name: 'Roads')
Category.create!(name: 'Rubbish')
Category.create!(name: 'Street Cleaning')
Category.create!(name: 'Street Lighting')
Category.create!(name: 'Traffic Lights')
Category.create!(name: 'Trees')
Category.create!(name: 'Other')

City.create!(name: 'Lisboa')
City.create!(name: 'Porto')
City.create!(name: 'Coimbra')
City.create!(name: 'Faro')
City.create!(name: 'Almada')
City.create!(name: 'Braga')
City.create!(name: 'Grandola')


puts "Done"

