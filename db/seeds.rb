# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Test User",
             email: "test@email.org",
             password:              "testpass",
             password_confirmation: "testpass",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@email.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  eventDate = rand(1..11).to_s + "/" + rand(1..31).to_s + "/" "2016"
  location = ["Rush Rhees", "Gleason Library", "Douglas Dining Hall", "Lovejoy Hall"].sample()
  content = Faker::Lorem.sentence(10)
  users.each { |user| user.microposts.create!(eventDate: eventDate, location: location, content: content) }
end

# Seed data for relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }