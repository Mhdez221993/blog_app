class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post
  validates :text, length: { maximum: 100, minimum: 2 }, presence: true

  after_save :comments_counter

  def comments_counter
    post.increment!(:comments_counter)
  end
end
