class RemoveCommentscounterFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :postcounter, :integer
  end
end
