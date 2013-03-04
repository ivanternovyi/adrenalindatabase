class MoveValidUntilDateAndPaymentRewardFromPaymentInfosToCardInfos < ActiveRecord::Migration
  def up
  	add_column :card_infos, :valid_until_date, :date
  	add_column :card_infos, :payment_reward, :integer
  	remove_column :payment_infos, :valid_until_date
  	remove_column :payment_infos, :payment_reward
  end

  def down
  	add_column :payment_infos, :valid_until_date, :date
  	add_column :payment_infos, :payment_reward, :integer
  	remove_column :card_infos, :valid_until_date
  	remove_column :card_infos, :payment_reward
  end
end
