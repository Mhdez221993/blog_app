# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
(1..5).each do |i|
  User.create( name: "Hdez #{i}", photo: "https://i.ytimg.com/vi/IvY_Hv90iOQ/hqdefault.jpg", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, odio ac interdum pharetra, velit elit dictum dui, sit amet fringilla dolor leo id justo. Suspendisse dapibus imperdiet eros non sodales. Nunc est odio, rhoncus et sodales in, mollis in lacus.", posts_counter: 0)

  user = User.last
  (1..5).each do |i|
    user.posts.create(title: "Lord of the rings ##{i}", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, odio ac interdum pharetra...", comments_counter: 0, likes_counter: 0)
    post = Post.last
    (1..10).each do |i|
      Comment.create(user_id: user.id, post_id: post.id, text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
    end
  end
end
#   Character.create(name: "Luke", movie: movies.first)
