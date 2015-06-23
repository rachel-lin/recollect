require 'faker'

# Create Users

10.times do
  user = User.new(
    name:  Faker::Name.name,
    email: Faker::Internet.email,
    password: 'helloworld',
    avatar: 'Faker::Avatar.image' 

    )
  user.skip_confirmation!
  user.save!
end

users = User.all

# Create Topics

15.times do
  Topic.create!(
    user: users.sample,
    name: Faker::Commerce.department,
    thumbnail: 'Faker::Avatar.image' 
    )
end

topics = Topic.all

# Create Bookmarks


50.times do
  Bookmark.create!(
    user: users.sample,
    topic: topics.sample,
    name: Faker::Lorem.sentence,
    url:  Faker::Internet.url
    )
end


bookmarks = Bookmark.all 



# CREATE USERS WITH ROLES LIKE SERIOUS ADULT ROLES 

# Create an admin user

admin = User.new(
  name: 'Admin User',
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
  )
admin.skip_confirmation!
admin.save!

# Create a moderator

moderator = User.new(
  name: 'Moderator User',
  email: 'moderator@example.com',
  password: 'helloworld',
  role: 'moderator'
  )
moderator.skip_confirmation!
moderator.save!

# Create a member

member = User.new(
  name: 'Member User',
  email: 'member@example.com',
  password: 'helloworld'
  )

member.skip_confirmation!
member.save!


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} posts created"