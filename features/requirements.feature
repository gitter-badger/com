Feature: Requirements

  Scenario: I should be able to add requirements to a deliverable
    Given I create a mission
      And I add the deliverable "foo" to it
    When I add the requirement "bar" to "foo"
    Then I should see "bar"
