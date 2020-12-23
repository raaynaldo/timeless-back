# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
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

john = User.create(first_name: 'John', last_name: 'Doe')
bryce = User.create(first_name: 'Bryce', last_name: 'Moore')
UserFollower.create(followee_id: john.id, follower_id: bryce.id)
post1 = Post.create(user_id: bryce.id, body: "hello")
tag1 = Tag.create(name: "cool")
PostTag.create(post_id: post1.id, tag_id: tag1.id)
