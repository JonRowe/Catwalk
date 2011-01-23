Feature: Presenting basic fields from an active model compatible model
  In order to seperate my presentation logic from my persistance models
  As a developer
  I want to wrap my models in a catwalk presenter

  Scenario: Basic usage
    Given I have an ActiveModel based model
    And my model has a attribute named "title"
    And I have a Catwalk presenter class for my model
    When I define a field "title"
    Then my presenter should present "title" from my model
