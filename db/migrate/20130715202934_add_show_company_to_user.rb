class AddShowCompanyToUser < ActiveRecord::Migration
  def change
    add_column :users, :show_company, :boolean, default: false
  end
end
