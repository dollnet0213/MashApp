class AddPostUserId < ActiveRecord::Migration[5.2]
  def change
    add_column :post, :user_id , :integer
  end
end
