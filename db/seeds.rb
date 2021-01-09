require 'faker'
require "open-uri"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Shop.destroy_all
User.destroy_all


CATEGORIES = [
'Adesivi & articoli tecnici',
'Giardinaggio',
'Antinfortunistica',
'Casalinghi',
'Colori',
'Edilizia',
'Elletrodomestici',
'Ferramenta',
'Idraulica',
'Magazzino',
'Materiale elettrico'
]

ADDRESSES = [
'Maarten Lutherweg 122, 1185 Amstelveen',
'Charley Tooropgracht 843, 1112 Diemen',
'Hovendaal 91, 9660 Brakel',
'Kerkstraat 273, 1017 Amsterdam',
'Leidseplein 15, 1017  Amsterdam',
'Van Breestraat 69, 1071 Amsterdam',
'Tweede Jan van der Heijdenstraat 2, 1073 Amsterdam',
'Lindengracht 23, 1015 Amsterdam',
'Meeuwenlaan 145, 1021 Amsterdam',
'J.J. Cremerplein 45, 1054 Amsterdam'
 ]

PRODUCTS_NAMES = [
'ACQUA DISTILLATA LT.5 AMACASA',
'DECESPUGLIATORE 25,4CC RBC254SESO (COMPATIBILE E-STAR)',
'GUANTI PALMATI PZ.500 BIANCHI IN ROTOLO',
'IGIENIZZANTE PRONTO PROFUMATO SPRAY ML.750 MADRAS',
'MANICI X RULLI D.8-SM.1101 20',
'BETONIERA MIX 100 MONOFASE HP 0,40',
'ASPIRACENERE ASHLEY 901',
'BATTENTE MONACO MM.150 OLV',
'ARIEGGIATORE A SCOPPIO COMBIC 38P',
'POMPA SOMMERSA 1100W INOX X ACQUE SPORCHE PF1110',
'AVVITATORE A PERCUSSIONE 18V LITIO S/BATTERIA BL MOTOR DHP483ZJ',
'FARO A LED 2x50W SU TREPPIEDE IN METALLO 2x4000 LUMEN 6500K IS747'
]

EMAILS = [
  'micciullapiero@gmail.com',
  'monicandreoli@gmail.com',
  'christianbale@yahoo.com',
  'timroth@hotmail.com',
  'batman@yahoo.com',
  'robin@gmail.com',
  'miakhalifa@hotmail.com',
  'jamesbond@yahoo.com',
  'brucewillis@hotmail.com',
  'brucewayne@hotmail.com',
  'brucebane@hotmail.com'
   ]

puts 'Creating 1 admin...'

admin = User.create(
    given_name: "Stefano",
    family_name: "Favarin",
    address: "Via Grantorto 123",
    email: "ferramenta.favarin@yahoo.it",
    password: "123456",
    city: "Grantorto",
    post_code: "35010",
    country: "Italy",
    )

puts "Created #{User.count} admin!"

user_buyer_1 = User.create(
    given_name: Faker::Name.first_name,
    family_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.shuffle!.pop,
    password: Faker::Internet.password,
    city: "Grantorto",
    post_code: "35010",
    country: "Italy"
    )

  user_buyer_2 = User.create(
    given_name: Faker::Name.first_name,
    family_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.shuffle!.pop,
    password: Faker::Internet.password,
    city: "Grantorto",
    post_code: "35010",
    country: "Italy"
    )

  user_buyer_3 = User.create(
    given_name: Faker::Name.first_name,
    family_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.shuffle!.pop,
    password: Faker::Internet.password,
    city: "Grantorto",
    post_code: "35010",
    country: "Italy"
    )

  user_buyer_4 = User.create!(
    given_name: Faker::Name.first_name,
    family_name: Faker::Name::last_name,
    address: ADDRESSES.sample,
    email: EMAILS.shuffle!.pop,
    password: Faker::Internet.password,
    city: "Grantorto",
    post_code: "35010",
    country: "Italy"
    )

  user_buyer_5 = User.create(
    given_name: 'Donald',
    family_name: 'Trump',
    address: 'USA',
    email: 'donaldtrump@hotmail.com',
    password: '456789',
    city: "Grantorto",
    post_code: "35010",
    country: "Italy"
    )


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


puts "Creating 7 reviews"

 Review.create!(
    user_id: user_buyer_1.id,
    content: "Pleasantly surprised by the produce and service...
    prices a bit at the high end but if you are a believer this
    is a good place to shop!",
    shop_id: presina.id
    )

 Review.create!(
    user_id: user_buyer_2.id,
    content: "Impressive selection of eko-foods.
    They have all kinds of meat as well as veggie options.
    I buy my truffles here",
    shop_id: presina.id,
    )

 Review.create!(
    user_id: user_buyer_3.id,
    content: "You get most of groceries here, vegetables and fruits are fresh.
    Also available surinami and indian stuff",
    shop_id: presina.id,
    )

  Review.create!(
    user_id: user_buyer_4.id,
    content: "What an amazing place to shop... the foods aren't even ugly!",
    shop_id: grantorto.id,
    )

   Review.create!(
    user_id: user_buyer_5.id,
    content: "Hated it.. Shop owner did not answer his messages, the hours on the shop were wrong
    and I'm not even sure that he got my order right. Love Ugly Foods though! What a great concept.",
    shop_id: grantorto.id,
    )

 Review.create!(
    user_id: user_buyer_4.id,
    content: "Good little supermarket. Too little biological meat for my
    taste. Nice selection of healthy items though",
    shop_id: grantorto.id,
    )

 Review.create!(
    user_id: user_buyer_5.id,
    content: "Lots of good stuff, but too few staff to ask when you can t
    find what you want. Also has a section of Polish delicacies.",
    shop_id: grantorto.id,
    )

 puts "Created #{Review.count} ratings!"


 puts "Creating products for the two shops..."

# CREATING PRODUCTS FOR SHOPs


    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: presina.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
    Product.create!(
        name: PRODUCTS_NAMES.sample,
        price: (200..500).to_a.sample,
        reference_number: (100000..999999).to_a.sample,
        shop_id: grantorto.id,
        category: CATEGORIES.sample,
        )
      puts "Created #{Product.count} products for shops..."

puts "Creating 5 carts"

cart_1 = Cart.create(
  pick_up_date: Date.today,
  user_id: user_buyer_5.id,
  status: "confirmed"
  )

cart_2 = Cart.create(
  pick_up_date: Date.tomorrow,
  user_id: user_buyer_5.id,
  status: "confirmed"
  )

cart_3 = Cart.create(
  pick_up_date: Date.tomorrow,
  user_id: user_buyer_5.id,
  status: "pending"
  )

cart_4 = Cart.create(
  pick_up_date: Date.tomorrow,
  user_id: user_buyer_2.id,
  status: "pending"
  )

cart_5 = Cart.create(
  pick_up_date: Date.tomorrow,
  user_id: user_buyer_4.id,
  status: "confirmed"
  )

puts "Created #{Cart.count} carts"

