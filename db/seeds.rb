User.create!(name:  "admin",
  email: "admin@example.com",
  password: "abc123",
  password_confirmation: "abc123",
  is_admin: true,
  avatar: Faker::Avatar.image("my-own-slug"))

10.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  avatar = Faker::Avatar.image("my-own-slug")
  User.create!(name: name,
    email: email,
    password: password,
    password_confirmation: password,
    avatar: avatar)
end
