FactoryGirl.define do
  factory :user do
    email "example#{Time.now.to_i}@email.com"
    town_office_id 1
    password 'thisisdefpass'
    password_confirmation { |u| u.password }
  end

  factory :town do
    sequence(:name) { |n| 'town#{}' }
    office false
  end
end