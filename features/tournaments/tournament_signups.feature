Feature: Setup Tournament for Registration
  With signups only

  Scenario: Sign up with a couple of people
    Given the following Tournament models:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    And I visit the tabs item "Signup"
    And I sign up for the following participants:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
      |            | Meier     | peter@meier.ch   |
      | Peter      |           | peter@meier.ch   |
      | Peter      | Meier     |                  |
      | Fritz      | Müller    | fritz@mueller.ch |
      |            | Müller    | fritz@mueller.ch |
      | Fritz      |           | fritz@mueller.ch |
      | Fritz      | Müller    |                  |
      |            |           |                  |
    Then there should be 9 participants
    And I should see the following participants:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
      |            | Meier     | peter@meier.ch   |
      | Peter      |           | peter@meier.ch   |
      | Peter      | Meier     |                  |
      | Fritz      | Müller    | fritz@mueller.ch |
      |            | Müller    | fritz@mueller.ch |
      | Fritz      |           | fritz@mueller.ch |
      | Fritz      | Müller    |                  |
      |            |           |                  |

  Scenario: Sign up for two different tournaments
    Given the following Tournament models:
      | title              | tournament_start |
      | Sucky Tournament   | 2014-01-05 08:00 |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 2nd tournament's "Admin" link
    And I visit the tabs item "Signup"
    And I sign up for the following participant:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
    Then there should be 1 participant
    And I should see the following participants:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    And I visit the tabs item "Signup"
    And I sign up for the following participants:
      | first_name | last_name | email            |
      | Fritz      | Müller    | fritz@mueller.ch |
    Then there should be 2 participants
    And I should see the following participants:
      | first_name | last_name | email |
      | Fritz      | Müller    | fritz@mueller.ch |

  Scenario: See and use auto stage creation
    Given the following Tournament models:
      | title              | tournament_start |
      | Awesome Tournament | 2014-01-05 08:00 |
    And I am a new, authenticated user
    And all your Tournament are belong to me
    When I visit the navbar item "Tournaments"
    And I click the 1st tournament's "Admin" link
    And I visit the tabs item "Signup"
    And I sign up for the following participant:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
    Then I should not see "Create Default Stages"
    When I sign up for the following participants:
      | first_name | last_name | email            |
      | Peter      | Meier     | peter@meier.ch   |
      | Peter      | Meier     | peter@meier.ch   |
      | Peter      | Meier     | peter@meier.ch   |
      | Peter      | Meier     | peter@meier.ch   |
    And I click "Create Default Stages"
    Then I should see "Default Stages created"
    And the "Schedule" tab should be active
