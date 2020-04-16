20.times do |n|
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
  CONTENTS = ['こんにちは', 'どもども', 'hello', "#{user.name}です。", "#{user.name}だよ", "#{user.name}と申します"]
  user.blogs.create!(
    content: CONTENTS[rand(0..5)],
    lat: rand(35.600000..35.700000).round(6), 
    lng: rand(139.600000..139.800000).round(6),
  )
end


5.times do |n|
  CONTENTS = ['おいしそうだね！', 'なくなっちゃったね', 'もう桜散っちゃったね', '職人だね', 'こんなところに森があった']
  User.find(rand(1..10)).blogs.create!(
    content: CONTENTS[n],
    lat: rand(35.647700..35.669600).round(6), 
    lng: rand(139.679700..139.721600).round(6),
    image: open("./db/fixtures/img#{n}.jpg")
  )
end

50.times do |n|
  Like.create!(
    user_id: rand(1..20),
    blog_id: rand(1..23),
  )
end

50.times do |n|
  Relationship.create!(
    follower_id: rand(1..20),
    followed_id: rand(1..20),
  )
end
