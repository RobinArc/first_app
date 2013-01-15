namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example",
                 firstname: "User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.last_name
      firstname = Faker::Name.first_name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   firstname: firstname,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 10)
    4.times do
      title = Faker::Lorem.sentence(5)
      genre = 0 + rand(2)
      name = Faker::Lorem.sentence(5)
      pages = 2 + rand(500)
      users.each { |user| user.publications.create!(title: title, genre: genre, name: name, pages: pages) }
    end
  end
end

