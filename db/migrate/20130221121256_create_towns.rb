class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.boolean :office, default: false

      t.timestamps
    end
    add_index :towns, :name
  end
end
