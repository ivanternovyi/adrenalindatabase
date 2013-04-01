Feature: Regular user can use application
  Login existing regular users
  View info about himself
  Logout regular user
  Register

  Scenario: Success authorization
    Given I am a RegularUser with name "Призв Тестимя Батьк", card number "0232" and password "1q2w3e4r"
    When I am on login page
    And I fill in "Номер карти або e-mail" with "0232"
    And I fill in "Пароль" with "1q2w3e4r"
    And I press "Вхід"
    Then page should have text "Профіль Тестимя Призв Батьк"