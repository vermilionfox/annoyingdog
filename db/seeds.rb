User.create!(name:  "Annoying Dog",
             email: "annoying@dog.org",
             password:              "barkbark",
             password_confirmation: "barkbark",
             admin: true)

30.times do |n|
  name  = Faker::Name.name
  email = "dog-#{n+1}@annoyingdog.org"
  password = "barkbark"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
