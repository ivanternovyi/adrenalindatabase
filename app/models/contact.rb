class Contact < ActiveRecord::Base
  attr_accessible :by_email, :by_icq, :by_phone, :by_skype, :icq_number, :skype_name, :user_id

  belongs_to :user
end
