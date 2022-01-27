class Like < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def likes_counter
    post.increment!(:likes_counter)
  end
end
