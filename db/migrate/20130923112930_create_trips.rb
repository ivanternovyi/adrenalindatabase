class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.text :rule

      t.timestamps
    end

    add_index :trips, :title
  end
end
