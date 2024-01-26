Feature: Feature1

A short summary of the feature

@tag1
Scenario: Search with a valid query
    Given I am on the Wikipedia homepage
    When I enter "Selenium" into the search field
    And I press the search button
    Then I should see the search results for "Selenium"

Scenario: Search with an invalid query
    Given I am on the Wikipedia homepage
    When I enter "asdfghjkl" into the search field
    And I press the search button
    Then I should see a message indicating no results were found

Scenario: Search with an empty query
    Given I am on the Wikipedia homepage
    When I press the search button
    Then I should stay on the homepage

Scenario: Search using special characters
    Given I am on the Wikipedia homepage
    When I enter "@#$%" into the search field
    And I press the search button
    Then I should see a message indicating no results were found