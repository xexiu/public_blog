# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  name:  "Sergio Mironescu",
  email: "sergiu.mironescu@gmail.com",
  password:              "foobarAdmin",
  password_confirmation: "foobarAdmin",
  admin: true)

User.create!(
  name:  "Test",
  email: "test@test.com",
  password:              "foobar",
  password_confirmation: "foobar")

50.times do |n|
  name  = Faker::Name.name
  email = "test#{n+1}@test.com"
  password = "foobarTest_#{n+1}"
  User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password)
end
