class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  def post_counter_for_user(id)
    Post.find(id).user.posts_counter += 1
  end

  def five_recent_comments()
    Post.comments.limit(5)
  end
end
