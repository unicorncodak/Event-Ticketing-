class RemoveUserFromEvents < ActiveRecord::Migration[6.1]
  def change
    remove_column :events, :user_id
    remove_column :events, :category_id
  end
end
