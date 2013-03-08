FactoryGirl.define do
  factory :user do
    email "example#{Time.now.to_i}@email.com"
    town_office_id 1
    password 'thisisdefpass'
    password_confirmation { |u| u.password }
  end

  factory :town do
    sequence(:name) { |n| "town#{n}" }
    office false
  end

  factory :user_detail do
    sequence(:surname) { |n| "Surname#{n}" }
    sequence(:name) { |n| "Name#{n}" }
    sequence(:mid_name) { |n| "Mid_name#{n}" }
    birthday 21.years.ago
    post_address { generate :random_string }
  end
end