Feature: Calculator
As a user, I want to use the search functionality on Wikipedia to find information.

@mytag
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
    And I press the search button
    Then I should stay on the homepage

Scenario: Search using special characters
    Given I am on the Wikipedia homepage
    When I enter "@#$%" into the search field
    And I press the search button
    Then I should see a message indicating no results were found

Scenario: Autocomplete in search
    Given I am on the Wikipedia homepage
    When I start typing "Selen" in the search field
    Then I should see autocomplete suggestions related to "Selen"

Scenario: Search using multiple languages
    Given I am on the Wikipedia homepage
    When I enter "Селен" into the search field
    And I press the search button
    Then I should see the search results for "Селен"

Scenario: Checking links on the search results page
    Given I am on the Wikipedia homepage
    And I enter "Selenium" into the search field
    And I press the search button
    When I click on the first link in the search results
    Then I should be redirected to the corresponding article

Scenario: Search using numbers
    Given I am on the Wikipedia homepage
    When I enter "2024" into the search field
    And I press the search button
    Then I should see the search results for "2024"

