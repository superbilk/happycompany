class AddThumbnailToUser < ActiveRecord::Migration
  def change
    add_column :users, :image_mini_thumb, :string
  end
end
