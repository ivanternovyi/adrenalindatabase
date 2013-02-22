class Town < ActiveRecord::Base
  attr_accessible :name, :office

  scope :with_office, where(office: true)
end
