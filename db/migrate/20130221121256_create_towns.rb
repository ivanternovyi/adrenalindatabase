class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :name
      t.boolean :office

      t.timestamps
    end
    add_index :towns, :name
  end
end
