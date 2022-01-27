class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, presence: true
  validates :text, length: { maximum: 250, minimum: 2 }, presence: true
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, presence: true
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, presence: true

  def post_counter_for_user(user)
    user.increment!(:posts_counter)
  end

  def like(user)
    likes << Like.new(user_id: user)
  end

  def five_recent_comments()
    Post.comments.limit(5)
  end
end
