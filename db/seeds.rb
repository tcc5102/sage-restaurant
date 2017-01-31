require 'faker'

# Create Users
5.times do
  user = User.create!(
    email: Faker::Internet.email,
    password: 'password'
  )
  user.save!
end

tyler = User.create!(
  email: 'tyler.cooper91@gmail.com',
  password: 'password'
)
tyler.save!

users = User.all
puts "#{User.count} users created"

10.times do
  restaurant = Restaurant.create!(
    title: Faker::Food.ingredient
  )
end

restaurants = Restaurant.all

# # Create items
# 25.times do
#   Item.create!(
#     user: users.sample,
#     name: Faker::Lorem.sentence
#   )
# end
# items = Item.all
# puts "#{Item.count} items created"
puts "Seed finished"
