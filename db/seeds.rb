# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Loading Coins...'

Coin.create!(
[{
  description: "Bitcoin",
  acronym: "BTC",
  url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
},{
  description: "Ethereum",
  acronym: "ETH",
  url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
},{
  description: "DogeCoin",
  acronym: "DOGE",
  url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
},{
  description: "Shiba Inu",
  acronym: "SHIB",
  url_image:"https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
}]
)

puts "Loading Completed sucessful"
