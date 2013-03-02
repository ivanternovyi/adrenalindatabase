class MoveCardNumberFromUsersToCardInfos < ActiveRecord::Migration
  def up
  	add_column :card_infos, :card_number, :string
  	add_index :card_infos, :card_number, :unique => true
  	User.all.each do |usr|
  		CardInfo.find_by_user_id(usr.id).update_attributes(card_number: usr.card_number)
  	end
  	remove_index :users, :card_number
  	remove_column :users, :card_number
  end

  def down
  	add_column :users, :card_number, :string
  	add_index :users, :card_number, :unique => true
  	CardInfo.where(discard: false).each do |ci|
  		User.find(ci.user_id).update_attributes(card_number: ci.card_number)
  	end
  	remove_index :card_infos, :card_number
  	remove_column :card_infos, :card_number
  end
end
