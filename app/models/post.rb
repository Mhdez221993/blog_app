class Post < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  validates :title, length: { maximum: 250, minimum: 2 }, presence: true
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :posts_counter

  def posts_counter
    user.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order('created_at DESC')
  end
end
