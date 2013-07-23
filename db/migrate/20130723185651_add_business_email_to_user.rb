class AddBusinessEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_email, :string
  end
end
