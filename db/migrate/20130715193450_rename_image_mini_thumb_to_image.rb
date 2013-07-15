class RenameImageMiniThumbToImage < ActiveRecord::Migration
  def change
    rename_column :users, :image_mini_thumb, :image
  end
end
