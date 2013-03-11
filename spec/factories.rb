# encoding: utf-8
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "example#{n}@email.com" }
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

  factory :card_info do
    barcode                   { |ci| ci.card_number }
    send_date                 { 20.days.ago }
    reminder_date             { 10.days.from_now }
    sequence(:card_number)    { |n| (3000 + n).to_s }
    valid_unlimit             false
    comment                   { generate(:random_string) }
    discard                   false
    valid_until               { 5.days.from_now }
    payment_reward            20
  end

  factory :payment_info do
    payment         120
    payment_date    5.days.ago
    paying_method   'офис'
  end

  factory :phone do
    sequence(:phone_number)   { generate(:telephone) } #phone mask /(^\+[0-9]{12,14}$)|(^[0-9]{11,12}$)/
    main                      false
  end

  sequence(:telephone) { |n|
    length=n.to_s.length
    if length >= 11 then
      n.to_s
      "+3#{n}"
    else
      padded_id='0' * (11-length)  + n.to_s
      "+3#{padded_id}"
    end
  }

  sequence(:random_string) {|n| "Два дня после этого Ростов не видал Долохова у своих и не заставал его дома; на третий день он получил от него записку.
«Так как я в доме у вас бывать более не намерен по известным тебе причинам и еду в армию, то нынче вечером я даю моим приятелям прощальную пирушку — приезжай в Английскую гостиницу». Ростов в десятом часу, из театра, где он был вместе с своими и Денисовым, приехал в назначенный день в Английскую гостиницу. Его тотчас же провели в лучшее помещение гостиницы, занятое на эту ночь Долоховым.#{n}" }
end