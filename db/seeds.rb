# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
20.times do
	flat = Flat.create!(
		name: Faker::GameOfThrones.character,
		address: Faker::Address.full_address,
		description: Faker::SiliconValley.quote,
		price_per_night: Faker::Number.between(30, 80),
		number_of_guests: Faker::Number.between(1, 10) 
	)
end
puts "finished!"