Feature: Setup Tournament for Registration
  With stages, after signups

  Scenario: Create two stages
    Given the following Tournament model:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    And I visit the tabs item "Schedule"
    Then I should see "You haven't created any stages for this tournament yet."
    When I click "Create new stage"
    And I fill in "stage_title" with "Awesome Stage"
    And I fill in "stage_number_of_rounds" with "5"
    And I press "Create stage"
    Then I should see "New Stage created"
    And I should see "Awesome Stage"

  Scenario: Check validation
    Given the following Tournament model:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    And I visit the tabs item "Schedule"
    And I click "Create new stage"
    And I press "Create stage"
    Then I should not see "New Stage created"
    And I should see an error for the field "stage_title"
    And I should see an error for the field "stage_number_of_rounds"
