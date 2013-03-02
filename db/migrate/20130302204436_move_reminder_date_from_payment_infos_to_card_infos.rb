class MoveReminderDateFromPaymentInfosToCardInfos < ActiveRecord::Migration
  def up
  	add_column :card_infos, :reminder_date, :date
  	remove_column :payment_infos, :reminder_date
  end

  def down
  	add_column :payment_infos, :reminder_date, :date
  	remove_column :card_infos, :reminder_date
  end
end
