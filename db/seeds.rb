10.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    icon: open("./db/fixtures/icon#{n}.jpg")
  )
end

User.all.each do |user|
  CONTENTS = ['こんにちは', 'どもども', 'hello', "#{user.name}です。"]
  user.blogs.create!(
    content: CONTENTS[rand(0..3)],
    lat: rand(35.647766..35.669583).round(6), 
    lng: rand(139.679803..139.721499).round(6),
  )
end


3.times do |n|
  CONTENTS = ['おいしそうだね！', 'なくなっちゃったね', 'もう桜散っちゃったね']
  User.find(rand(1..10)).blogs.create!(
    content: CONTENTS[n],
    lat: rand(35.647766..35.669583).round(6), 
    lng: rand(139.679803..139.721499).round(6),
    image: open("./db/fixtures/img#{n}.jpg")
  )
end

20.times do |n|
  Like.create!(
    user_id: rand(1..10),
    blog_id: rand(1..13),
  )
end

20.times do |n|
  Relationship.create!(
    follower_id: rand(1..10),
    followed_id: rand(1..10),
  )
end
