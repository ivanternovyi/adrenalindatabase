class AddValidUnlimitToCardInfos < ActiveRecord::Migration
  def change
    add_column :card_infos, :valid_unlimit, :boolean, default: false
  end
end
