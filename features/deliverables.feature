Feature: Deliverables
  Scenario: I should be able to delete deliverables
    Given I create a mission
      And I add the deliverable "foo" to it
    When I delete "foo"
    Then I should not see "foo"
