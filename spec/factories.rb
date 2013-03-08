FactoryGirl.define do |f|
  factory :user do
    email "example#{Time.now.to_i}@email.com"
    town_office_id 1
    password 'thisisdefpass'
    password_confirmation { |u| u.password }
  end
end