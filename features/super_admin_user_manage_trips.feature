# Feature: Super Admin User can manage trips.
#   Only Super Admin User can create new trip. And manage rules for trip.
#   Trip have some fields: 
#     - name
#     - description
#     - trip_dates (include field set: date_from, date_to)
#     - trip_rules (create required fields with check box and text), user must accept rules

#   Background: Existing Super Admin User
#     Given I am a SuperAdminUser with name "Супер Пупер Юзер", card number "0232" and password "1q2w3e4r"
#     And I was logged in with card number "0232" and password "1q2w3e4r"

#   Scenario: Create rules
#     Given I am on new trip rule page
#     When I fill in "Name" with "Не пить"
#     And I press "Зберегти"
#     Then I have to see "Нове правило створено успішно"

#   Scenario: Create trip
#     Given trip rules:
#       |Я согласен с поселением в гостинницу                  |
#       |Я согласен с правилами поведения в автобусе           |
#       |Я согласен с правилами внесения организационной оплаты|
#     And I am on new trip page
#     When I fill in "trip_name" with "Пустынный остров"
#     And I fill in "trip_description" with "Сверхромантичная поездка на остров в средизеаном море с прозрачной сорской водой водой. Экзотические флора и фауна приятно скрасят Ваш досуг. Рыбалка, купание, дайвинг."
#     And I add new date, fill in new date "trip_trip_dates_attributes_0_date_from" with "10-05-2013" and "trip_trip_dates_attributes_0_date_to" with "10-06-2013"
#     And I set check box "ttr_1"
#     And I set check box "ttr_2"
#     And I set check box "ttr_3"
#     And I press "Створити тур"
#     Then I have to see "Trip was successfully created."