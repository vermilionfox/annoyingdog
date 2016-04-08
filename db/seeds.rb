User.create!(name:  "'s Dog",
             email: "example@annoyingdog.org",
             password:              "barkbark",
             password_confirmation: "barkbark")

30.times do |n|
  name  = Faker::Name.name
  email = "dog-#{n+1}@annoyingdog.org"
  password = "barkbark"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
