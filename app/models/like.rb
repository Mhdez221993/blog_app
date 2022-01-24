class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def likes_counter_for_post(_id)
    Like.find(id).posts.likes_counter += 1
  end
end
