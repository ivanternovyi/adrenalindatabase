Feature: Regular user can use application
  Login existing regular users
  View info about himself
  Logout regular user
  Register

  Scenario: Success authorization
    Given I am on login page
    And I fill in "Номер карти або e-mail" with "0232"
    And I fill in "Пароль" with "1q2w3e4r"
    When I press "Вхід"
    Then page should have notice "Hello!"