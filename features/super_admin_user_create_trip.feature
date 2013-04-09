Feature: Super Admin User can create trips.
  Only Super Admin User can create new trip.
  Trip have some fields: 
    - name
    - description
    - trip_dates (include field set: date_from, date_to)
    - trip_rules (create required fields with check box and text), user must accept rules

  Background: Existing Super Admin User
    Given I am a SuperAdminUser with name "Супер Пупер Юзер", card number "0232" and password "1q2w3e4r"
    And I was logged in
    And trip rules:
      |Я согласен с поселением в гостинницу                  |
      |Я согласен с правилами поведения в автобусе           |
      |Я согласен с правилами внесения организационной оплаты|

  Scenario: Create trip
    Given I am on new trip page
    And I fill in "Trip name" with "Пустынный остров"
    And I fill in "Description" with "Сверхромантичная поездка на остров в средизеаном море с прозрачной сорской водой водой. Экзотические флора и фауна приятно скрасят Ваш досуг. Рыбалка, купание, дайвинг."
    And I add new date, fill in new date "Date from" with "10-05-2013" and "Date to" with "10-06-2013"
    And I add new date, fill in new date "Date from" with "14-05-2013" and "Date to" with "28-05-2013"
    And I set check box "Я согласен с поселением в гостинницу"
    And I set check box "Я согласен с правилами поведения в автобусе"
    And I set check box "Я согласен с правилами внесения организационной оплаты"
    And press button "Register"
    Then I have to see thanks text.
