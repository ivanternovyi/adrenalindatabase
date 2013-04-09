# encoding: utf-8
class Trip < ActiveRecord::Base
  attr_accessible :description, :name, :trip_rules, :trip_dates, :trip_dates_attributes, :trip_rule_ids

  has_many :trip_to_trip_rules, dependent: :destroy
  has_many :trip_rules, through: :trip_to_trip_rules
  
  has_many :trip_dates, dependent: :destroy
  accepts_nested_attributes_for :trip_dates, allow_destroy: true, reject_if: lambda {|attrs| attrs.all? {|key, value| value.blank?}}

  validates_presence_of :name, message: "Ім'я не повинно бути порожнім"
  validates_presence_of :description, message: "Опис туру не має бути порожнім"
  validates_presence_of :trip_rules, message: "Добавте хоч одне правило подорожі"
  validates_presence_of :trip_rules, message: "Добавте хоч одне правило подорожі"
  validates_presence_of :trip_dates, message: "Добавте будь-ласка дати подорожі"
end
