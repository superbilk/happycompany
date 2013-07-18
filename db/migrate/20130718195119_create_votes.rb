class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :grade
      t.text :best
      t.text :worst
      t.text :recommendation
      t.text :comment
      t.string :company
      t.references :user, index: true

      t.timestamps
    end
  end
end
