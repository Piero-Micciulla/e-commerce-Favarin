# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Creating 1 admin...'

admin = User.create(
    first_name: "Stefano",
    last_name: "Favarin",
    address: "Via Grantorto 123",
    email: "ferramenta.favarin@yahoo.it",
    password: "123456",
    city: "Grantorto",
    post_code: "35010",
    country: "Italy",
    )

puts "Created #{User.count} admin!"

puts 'Creating 2 shops...'

presina = Shop.create(
    user_id: admin.id,
    name: "Negozio Presina",
    address: "Via Grantorto 123",
    city: "Piazzola sul Brenta",
    post_code: "35016",
    country: "Italy",
    phone_number: "049 559 1272"
    )

grantorto = Shop.create(
    user_id: admin.id,
    name: "Negozio Grantorto",
    address: "Via Umberto I 49",
    city: "Grantorto",
    post_code: "35010",
    country: "Italy",
    phone_number: "049 596 0417",
    )

puts "Created #{Shop.count} shops!"
