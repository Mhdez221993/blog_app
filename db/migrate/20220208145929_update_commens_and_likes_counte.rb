class UpdateCommensAndLikesCounte < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :comments_counter, :integer, default: 0, null: false
    change_column :posts, :likes_counter, :integer, default: 0, null: false
  end
end
