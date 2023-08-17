# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(name: "Juanito Perez")
Course.create(name: "Ruby on Rails", description: "Aprende Ruby on Rails desde cero a nivel profesional", price: 20.0, teacher: "Juanito Perez", user_id: 1)
