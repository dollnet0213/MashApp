class AddPostTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :post ,:title,:string
  end
end
