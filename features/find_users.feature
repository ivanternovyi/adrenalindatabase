Feature: Find users
  Admin can find user by card barcode
  Also admins can find users by Sirname and sort this list by registration data, Name, Birthday, City

  Background: Existion admin user
    Given I am a SuperAdminUser with name "Супер Пупер Юзер", card number "0232" and password "1q2w3e4r"
    And I was logged in with card number "0232" and password "1q2w3e4r"
    And existing RegularUser with name "Іванов Іван Іванович", card number "0112" and password "1qaz2wsx"
    And existing RegularUser with name "tsts sts stss", card number "0010" and password "1qaz2wsx"
    And existing RegularUser with name "and one user", card number "0981" and password "1qaz2wsx"

  Scenario: Find user by barcode
    Given I am on the home page
    When I fill in "s_card_barcode" with "00000109"
    And I press "Шукати"
    Then I have to see result: 1 record