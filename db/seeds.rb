# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Contractor.create(name: "bob", email: "Asdf12@gmail.com", hourly_rate: 40, specialty: "Concrete", active: true)
User.create!(email: "email@email.com", password: "password")