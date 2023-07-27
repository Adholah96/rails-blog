# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Creating User with ID 3
@user1 = User.create(id: 3, name: 'Tom', photo: 'https://unsplash.com/photos', bio: 'Teacher from Mexico.', posts_counter: 0)

# Creating Post associated with User with ID 3
@first_post = Post.create(author: @user1, title: 'post1', text: 'This is my first post', likes_counter: 0, comments_counter: 0)

# Creating Comment associated with User with ID 3 and Post with ID 10
@comment1 = Comment.create(post: @first_post, author: @user1, text: 'Hi Tom!, Nice comment')
