# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
first_user = User.create!(name: 'Tom', email: 'exemple@exemple.com', password: '1234567', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Teacher from Mexico.',posts_counter: 0)
second_user = User.create!(name: 'Lilly', email: 'sample@sample.com', password: '123456', photo: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJHYna2rR4LtBNlA3gUSGxsmaiYY4PyxQEcA&usqp=CAU', bio: 'Teacher from Poland.',posts_counter: 0)
first_post = Post.create!(author: first_user, title: 'Hello', text: 'This is my first post',comments_counter: 0,likes_counter: 0)
second_post = Post.create!(author: second_user, title: 'Hello', text: 'This is my first post',comments_counter: 0,likes_counter: 0)
first_comment =  Comment.create!(post: first_post, author: second_user, text: 'Hi Tom!' )
like = Like.create!(author: first_user, post: first_post)