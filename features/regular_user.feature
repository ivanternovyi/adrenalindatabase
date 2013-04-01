Feature: Regular user can use application
  Login existing regular users
  View info about himself
  Logout regular user
  Register

  Background: Existing RegularUser autorizes succesfully
    Given I am a RegularUser with name "Призв Тестимя Батьк", card number "0232" and password "1q2w3e4r"
    When I am on login page
    And I fill in "Номер карти або e-mail" with "0232"
    And I fill in "Пароль" with "1q2w3e4r"
    And I press "Вхід"

  Scenario: Show my profile on login
    Then page should have text "Профіль Тестимя Призв Батьк"

  Scenario: Logout regular user
    When I click "Вийти"
    Then I have to see "Вхід"

  Scenario: Restrict access to towns area
    When I go to towns page
    Then I have to see "Ви не можете перейти на цю сторінку."