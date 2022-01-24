# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
(1..10).each do |i|
  User.create([{ name: "name#{i}", photo: "Photo#{i}", bio: "Bio#{i}" }])
end
#   Character.create(name: "Luke", movie: movies.first)
