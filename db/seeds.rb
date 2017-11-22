require 'faker'

10.times do
  restaurant = Restaurant.create!(
    address: Faker::Address.street_address + " " + Faker::Address.city,
    name: Faker::Company.name,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
    )

  review = Review.create!(
    content: "OER CE SUPER I6",
    rating: 5,
    restaurant: restaurant
    )
end



