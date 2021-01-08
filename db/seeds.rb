# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
UserFollower.destroy_all
Post.destroy_all
Tag.destroy_all
PostTag.destroy_all

bryce = User.create!(first_name: "Bryce", last_name: "Moore", username: "brycem", email: "bryce_moore@example.com", password: "123", birthday: "2001-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01BD01ER1S-a7ebb138dff4-512")
ray = User.create!(first_name: "Raynaldo", last_name: "Sutisna", username: "raynaldos", email: "raynaldo_sutisna@example.com", password: "123", birthday: "1995-01-31", image: "https://ca.slack-edge.com/T02MD9XTF-U01BM15CCN8-a0132e1d0007-512")
adam = User.create!(first_name: "Adam", last_name: "Johnson", username: "adamj", email: "adam_johnson@example.com", password: "123", birthday: "1993-01-01", image: "https://media-exp1.licdn.com/dms/image/C4E03AQEejOwJNedRGQ/profile-displayphoto-shrink_800_800/0/1579183758618?e=1615420800&v=beta&t=1lB76X3P2sU30phcwmbvRt-Z-rA55l6LVs-G4tZGedA")
matteo = User.create!(first_name: "Matteo", last_name: "Ricci", username: "matteor", email: "matteo_ricci@example.com", password: "123", birthday: "1996-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-USAM1A3MH-3708872f5317-512")
jake = User.create!(first_name: "Jake", last_name: "Short", username: "jakes", email: "jake_short@example.com", password: "123", birthday: "1988-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U019WAZU7DY-8ae2bb98a290-512")
sharad = User.create!(first_name: "Sharad", last_name: "Satsangi", username: "sharads", email: "sharad_satsangi@example.com", password: "123", birthday: "1988-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01CP2L1T6U-816e230a5331-512")
alyssa = User.create!(first_name: "Alyssa", last_name: "Easterly", username: "alyssae", email: "alyssa_easterly@example.com", password: "123", birthday: "1994-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01BKBGV1LK-fccdf0047c14-512")
ben = User.create!(first_name: "Ben", last_name: "Hessel", username: "benh", email: "ben_hessel@example.com", password: "123", birthday: "1993-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01B6HAMJKV-gd757514c436-512")
mauro = User.create!(first_name: "Mauro", last_name: "Dorigo", username: "maurod", email: "mauro_dorigo@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U019HQNV6SJ-eec29624a2be-512")
paul = User.create!(first_name: "Paul", last_name: "Nicholsen", username: "pauln", email: "paul_nicholsen@example.com", password: "123", birthday: "1987-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U9ZRW52TY-5f1673160915-512")
anne = User.create!(first_name: "Anne", last_name: "Nardolilli", username: "annen", email: "anne_nardolilli@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01C283ASJY-8bd041b04bfb-512")
erick = User.create!(first_name: "Erick", last_name: "Villeda", username: "erickv", email: "erick_villeda@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U018UU1LQTF-3f7f3cbd41cf-512")
jacob = User.create!(first_name: "Jacob", last_name: "Kagon", username: "jacobk", email: "anne_kagon@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01ADTX2M71-e740cec53d22-512")
justin = User.create!(first_name: "Justin", last_name: "Clifford", username: "justinc", email: "justin_clifford@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U01B6HAAWE7-64ced1beb6c4-512")
james = User.create!(first_name: "James", last_name: "Bond", username: "jamesb", email: "james_bond@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U018KT74KCZ-a914cdd23556-512")
kellie = User.create!(first_name: "Kellie", last_name: "Hamilton", username: "kellieh", email: "kellie_h@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U018X446SD6-895e06669ce4-512")
njeri = User.create!(first_name: "Njeri", last_name: "Kamau", username: "njerik", email: "njeri_kamau@example.com", password: "123", birthday: "1990-01-01", image: "https://ca.slack-edge.com/T02MD9XTF-U015PSUDVFY-5e3cfdffb261-512")

puts "User Done"

def default_posts(birthday)
  [{ body: "Born Today",
     post_date: birthday,
     image: "https://images.unsplash.com/photo-1503431760783-91f2569f6802?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80" },
   { body: "Welcome to Timeless", image: " https://images.unsplash.com/photo-1580191947416-62d35a55e71d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80" }]
end

User.all.each do |user|
  user.posts.build(default_posts(user.birthday))
  user.save!
end
puts "Default Posts Done"

User.all.each do |user1|
  User.all.each do |user2|
    if [true, false].sample()
      UserFollower.create!(followee_id: user1.id, follower_id: user2.id)
    end
  end
end
puts "UserFollower Done"

collection = [3482337, 3465768, 3482840, 3460702, 2423512, 1108338, 466382, 1494157, 1541586, 1547903,
              1515572, 2323045, 91907222, 81016826, 17839357, 8931165, 27268519, 41870369, 91036249, 451022]
counter = 0
(2002..2021).each do |year|
  tag = Tag.create!(name: year.to_s)
  bryce.posts.build({ body: "Happy New Year", post_date: "#{year}-01-02", image: "https://source.unsplash.com/collection/#{collection[counter]}" })
  bryce.save!
  bryce.posts.second.tags << tag
  ray.posts.build({ body: "Happy New Year", post_date: "#{year}-01-02", image: "https://source.unsplash.com/collection/#{collection[counter]}" })
  ray.save!
  ray.posts.second.tags << tag
  counter += 1
end
puts "Ray and Bryce Posts Done"

# UserFollower.create!(followee_id: john.id, follower_id: bryce.id)
# UserFollower.create!(followee_id: john.id, follower_id: ray.id)
# UserFollower.create!(followee_id: bryce.id, follower_id: ray.id)
# post1 = Post.create!(user_id: bryce.id, body: "hello")
# tag1 = Tag.create!(name: "cool")
# PostTag.create!(post_id: post1.id, tag_id: tag1.id)
