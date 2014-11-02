Feature: Create Tournament
  With basic information

  Scenario: Create tournament
    Given I am a new, authenticated user
    When I visit the navbar item "Tournaments"
    And I click "Create new Tournament"
    And I fill in "tournament_title" with "Awesome Tournament"
    And I fill in "tournament_tournament_start" with "2014-01-02 10:00"
    And I press "Create Tournament"
    Then I should see "New Tournament created"
    And I should see "Admin: Awesome Tournament"

  Scenario: Check validation
    Given I am a new, authenticated user
    When I visit the navbar item "Tournaments"
    And I click "Create new Tournament"
    And I press "Create Tournament"
    Then I should not see "New Tournament created"
    And I should see an error for the field "tournament_title"
    And I should see an error for the field "tournament_tournament_start"

  Scenario: View Tournaments list
    Given I am a new, authenticated user
    When I visit the navbar item "Tournaments"
    And I click "Create new Tournament"
    And I fill in "tournament_title" with "Awesome Tournament"
    And I fill in "tournament_tournament_start" with "2014-01-02 10:00"
    And I press "Create Tournament"
    And I visit the navbar item "Tournaments"
    And I click "Create new Tournament"
    And I fill in "tournament_title" with "Another Awesome Tournament"
    And I fill in "tournament_tournament_start" with "2014-01-02 10:00"
    And I press "Create Tournament"
    And I visit the navbar item "Tournaments"
    Then I should see 2 tournaments in the list

  Scenario: Navigate to admin and show for new tournament
    Given I am a new, authenticated user
    When I visit the navbar item "Tournaments"
    And I click "Create new Tournament"
    And I fill in "tournament_title" with "Awesome Tournament"
    And I fill in "tournament_tournament_start" with "2014-01-02 10:00"
    And I press "Create Tournament"
    And I visit the navbar item "Tournaments"
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
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Show" link
    Then I should see "Awesome Tournament"
    And I should see the following tabs:
      | name      | active |
      | Info      | X      |
      | Guide     |        |
      | Timeline  |        |
      | Standings |        |
