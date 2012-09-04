Feature: Link Roll
  In order to stay informed
  As a user
  I should see a list of links that were shared

  Background:
    Given I am on the links page

  Scenario: Show links
    Then I should see a list of links

  Scenario: Most recent first
    Then I should see the newest link first
