Feature: Login, logout
  Do login and do logout

  Scenario: Creating a new account
    Given I am not authenticated
    When I click "Sign Up"
    And I fill in "account_email" with "arr@arr.com"
    And I fill in "account_password" with "iamapirate"
    And I fill in "account_password_confirmation" with "iamapirate"
    And I press "sign-up"
    And I confirm my account through the link in the mail
    And I fill in "account_email" with "arr@arr.com"
    And I fill in "account_password" with "iamapirate"
    And I press "log-in"
    Then I should see "Signed in successfully."

  Scenario: Shorthand to login
    Given I am a new, authenticated user
    Then I should see "Signed in successfully."
