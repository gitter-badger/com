Feature: Deliverables

  Scenario: I should be able to add Deliverables to a Mission
    When I create a mission
      And I add the deliverable "foo" to it
    Then I should see "foo" on the mission

  Scenario: I should be able to delete deliverables
    Given I create a mission
      And I add the deliverable "foo" to it
    When I delete "foo"
    Then I should not see "foo"
