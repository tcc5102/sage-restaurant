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
    title: Faker::Food.ingredient,
    rating: Faker::Number.between(1, 5)
  )
end

restaurants = Restaurant.all

puts "#{Restaurant.count} restaurants created"
puts "Seed finished"
