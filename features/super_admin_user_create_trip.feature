Feature: Super Admin User can create trips.
  Only Super Admin User can create new trip.
  Trip have some fields: 
    - name
    - description
    - trip_dates (include field set: date_from, date_to)
    - trip_rules (create required fields with check box and text), user must accept rules

  Background: Existing Super Admin User
    Given I am a SuperAdminUser with name "Супер Пупер Юзер", card number "0232" and password "1q2w3e4r"
    And I was logged in with card number "0232" and password "1q2w3e4r"
    And trip rules:
      |Я согласен с поселением в гостинницу                  |
      |Я согласен с правилами поведения в автобусе           |
      |Я согласен с правилами внесения организационной оплаты|

  Scenario: Create trip
    Given I am on new trip page
    And I fill in "Name" with "Пустынный остров"
    And I fill in "Description" with "Сверхромантичная поездка на остров в средизеаном море с прозрачной сорской водой водой. Экзотические флора и фауна приятно скрасят Ваш досуг. Рыбалка, купание, дайвинг."
    And I add new date, fill in new date "trip_trip_dates_attributes_0_date_from" with "10-05-2013" and "trip_trip_dates_attributes_0_date_to" with "10-06-2013"
    And I set check box "Я согласен с поселением в гостинницу"
    And I set check box "Я согласен с правилами поведения в автобусе"
    And I set check box "Я согласен с правилами внесения организационной оплаты"
    When I press "Створити Trip"
    Then I have to see "thanks"
