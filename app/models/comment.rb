class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def comments_counter_for_post(id)
    Comment.find(id).posts.comments_counter += 1
  end
end
