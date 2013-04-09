# encoding: utf-8
class Trip < ActiveRecord::Base
  attr_accessible :description, :name, :trip_rules, :trip_dates

  has_many :trip_to_trip_rules, dependent: :destroy
  has_many :trip_rules, through: :trip_to_trip_rules
  
  has_many :trip_dates, dependent: :destroy

  validates_presence_of :trip_rules, message: "Добавте хоч одне правило подорожі"
  validates_presence_of :trip_dates, message: "Добавте будь-ласка дати подорожі"
end
