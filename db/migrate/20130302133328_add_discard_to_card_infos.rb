class AddDiscardToCardInfos < ActiveRecord::Migration
  def change
    add_column :card_infos, :discard, :boolean, default: false
  end
end
