# encoding: utf-8
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
    birthday { 21.years.ago }
    post_address { generate :random_string }
    registration_timestamp { DateTime.now }
    comment { generate(:random_string) }
  end

  factory :role do
    sequence(:name) { |n| "Role#{n}" }
    description { generate(:random_string)}
  end

  sequence(:random_string) {|n| "Два дня после этого Ростов не видал Долохова у своих и не заставал его дома; на третий день он получил от него записку.
«Так как я в доме у вас бывать более не намерен по известным тебе причинам и еду в армию, то нынче вечером я даю моим приятелям прощальную пирушку — приезжай в Английскую гостиницу». Ростов в десятом часу, из театра, где он был вместе с своими и Денисовым, приехал в назначенный день в Английскую гостиницу. Его тотчас же провели в лучшее помещение гостиницы, занятое на эту ночь Долоховым.#{n}" }
end