class AddCommentValidUntilToCardInfos < ActiveRecord::Migration
  def change
    add_column :card_infos, :comment, :text
    add_column :card_infos, :valid_until, :date
  end
end
