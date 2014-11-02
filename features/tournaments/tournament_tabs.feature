Feature: View Tournament Tabs
  With basic information

  Scenario: View all Show tabs for a tournament
    Given the following Tournament models:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Show" link
    Then I should see "Awesome Tournament"
    And I should see the following tabs:
      | name      | active |
      | Info      | X      |
      | Guide     |        |
      | Timeline  |        |
      | Standings |        |
    And I can visit the tabs item "Info"
    And I can visit the tabs item "Guide"
    And I can visit the tabs item "Timeline"
    And I can visit the tabs item "Standings"
    And I should see the following tabs:
      | name      | active |
      | Info      |        |
      | Guide     |        |
      | Timeline  |        |
      | Standings | X      |

  Scenario: View all Show tabs for a tournament
    Given the following Tournament models:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    Then I should see "Admin: Awesome Tournament"
    And I should see the following tabs:
      | name      | active |
      | Update    |        |
      | Signup    | X      |
      | Schedule  |        |
      | Register  |        |
      | Run       |        |
      | Info      |        |
      | Timeline  |        |
      | Standings |        |
    And I can visit the tabs item "Update"
    And I can visit the tabs item "Signup"
    And I can visit the tabs item "Schedule"
    And I can visit the tabs item "Register"
    And I can visit the tabs item "Run"
    And I can visit the tabs item "Info"
    And I should see the following tabs:
      | name      | active |
      | Update    |        |
      | Signup    |        |
      | Schedule  |        |
      | Register  |        |
      | Run       |        |
      | Info      | X      |
      | Timeline  |        |
      | Standings |        |
    And I can visit the tabs item "Timeline"
    And I can visit the tabs item "Standings"
