# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

    until Kitten.count == 100 do
        Kitten.create(
        description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
        date: Faker::Date.between(from: 10.years.ago, to: Date.today)
        )
    end
  