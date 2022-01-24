class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post

  def comments_counter_for_post(post)
    post.increment!(:comments_counter)
  end
end
