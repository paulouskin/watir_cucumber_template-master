@second
Feature: Second lunch browser and hit seleniumframework.com
  Scenario: Open seleniumframework site and print page details
    Given I navigate to http://www.seleniumframework.com site
    When I click to FORUMS link
    And I wait for about page
    Then page contain next details:
    |key|value|
    |title      | FORUMS  |
    |current_url|http://www.seleniumframework.com/forums/|