class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def three_recent_user
    User.limit(3).order(created_at: :asc)
  end
end
