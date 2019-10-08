class RenaPostsPost < ActiveRecord::Migration[5.2]
  def change
    rename_table :posts,:post
  end
end
