class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def post_counter_for_user(user)
    user.increment!(:posts_counter)
  end

  def five_recent_comments()
    Post.comments.limit(5)
  end
end
