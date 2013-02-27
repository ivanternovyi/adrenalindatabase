class CreatePaymentInfos < ActiveRecord::Migration
  def change
    create_table :payment_infos do |t|
      t.integer :card_info_id
      t.date :payment_date
      t.date :valid_until_date
      t.date :reminder_date
      t.integer :payment_reward
      t.integer :payment

      t.timestamps
    end
    add_index :payment_infos, :card_info_id
  end
end
