Feature: Info

  Scenario: I should be able to see information about the site
    When I goto the homepage
    Then I should see information about KEEP DELIVERING

  Scenario: I should be able to do create missions
    When I goto the homepage
    Then I should see a link to "Begin a Mission"
