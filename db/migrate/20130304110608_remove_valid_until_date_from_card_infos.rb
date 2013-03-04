class RemoveValidUntilDateFromCardInfos < ActiveRecord::Migration
  def up
  	remove_column :card_infos, :valid_until_date
  end

  def down
  	add_column :card_infos, :valid_until_date, :date
  end
end
