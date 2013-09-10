class AddPriceToTripDate < ActiveRecord::Migration
  def change
    add_column :trip_dates, :price, :integer
  end
end
