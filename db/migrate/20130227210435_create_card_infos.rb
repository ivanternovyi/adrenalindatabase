class CreateCardInfos < ActiveRecord::Migration
  def change
    create_table :card_infos do |t|
      t.integer :user_id
      t.string :barcode
      t.date :send_date

      t.timestamps
    end
    add_index :card_infos, :user_id
    add_index :card_infos, :barcode
  end
end
