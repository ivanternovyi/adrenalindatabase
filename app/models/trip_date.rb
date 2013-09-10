# encoding: utf-8
class TripDate < ActiveRecord::Base
  attr_accessible :date_from, :date_to, :trip_id, :price

  validates_presence_of [:date_from, :date_to], message: 'Необхідно вказати дату'
  validates_datetime :date_to, after: :date_from

  belongs_to :trip

  has_many :user_to_trip_dates, dependent: :destroy
end
