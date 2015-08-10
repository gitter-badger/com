Feature: Missions

  Scenario: I should be able to see Missions
    When I have missions
    Then I should see missions

  Scenario: I should be able to see a Mission
    When I view a mission
    Then I see that mission

  Scenario: I should be able to create a Mission
    When I create a mission
    Then I see that mission

  Scenario: I should be able to update a Mission
    When I update a mission
    Then I see that mission

  Scenario: I should be able to add Deliverables to a Mission
    When I create a mission
      And I add the deliverable "foo" to it
    Then I should see the "foo" deliverable on the mission
