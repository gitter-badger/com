Feature: Missions

  Scenario: See missions
    When I have missions
    Then I should see missions

  Scenario: Displays the name
    When I view a mission
    Then I see that mission

  Scenario: Create a mission
    When I create a mission
    Then I see that mission

  Scenario: Edit a mission
    When I update a mission
    Then I see that mission
