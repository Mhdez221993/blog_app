class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, presence: true

  def three_recent_user
    User.limit(3).order(created_at: :asc)
  end
end
