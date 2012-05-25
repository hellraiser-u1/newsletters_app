namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Johan van Rensburg",
                 email: "hellraiser@gmail.com",
                 password: "h3llf1re",
                 password_confirmation: "h3llf1re")
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end