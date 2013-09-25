class Trip < ActiveRecord::Base
  attr_accessible :description, :title, :rule, :trip_dates
  has_many :trip_dates, dependent: :destroy

end
