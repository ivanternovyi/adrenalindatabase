class AddPayingMethodToPaymentInfos < ActiveRecord::Migration
  def change
    add_column :payment_infos, :paying_method, :string
  end
end
