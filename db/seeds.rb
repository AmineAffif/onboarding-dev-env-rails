require 'faker'

puts "Seeding data..."

10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "Created 10 users with Faker data."
