class AddPostImage < ActiveRecord::Migration[5.2]
  def change
    add_column :post, :image_name,:string
  end
end
