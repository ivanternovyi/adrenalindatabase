class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
    	t.integer :user_id
      t.string :phone_number
      t.boolean :main, default: false

      t.timestamps
    end
    add_index :phones, :user_id
    add_index :phones, :phone_number
    add_index :phones, :main
  end
end
