# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
(1..10).each do |i|
  User.create([{ name: "User name #{i}", photo: "https://cdn.learnenough.com/rails.svg", bio: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, odio ac interdum pharetra, velit elit dictum dui, sit amet fringilla dolor leo id justo. Suspendisse dapibus imperdiet eros non sodales. Nunc est odio, rhoncus et sodales in, mollis in lacus." }])

  user = User.last
  (1..5).each do |i|
    user.posts.create(title: "Post ##{i}", text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque fermentum, odio ac interdum pharetra...")
  end
end
#   Character.create(name: "Luke", movie: movies.first)
