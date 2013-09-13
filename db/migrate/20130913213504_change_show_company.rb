class ChangeShowCompany < ActiveRecord::Migration
  def change
    change_column :users, :show_company, :boolean, default: true
  end
end

