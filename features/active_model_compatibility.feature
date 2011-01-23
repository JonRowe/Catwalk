Feature: Active Model compatibility
  In order to use presenters interchangably with active models
  As a developer
  I wish to use catwalk to present my models whilst adhering to ActiveModel::Lint

  Scenario: Basic Active Model functionality
    Given I have an ActiveModel based model
    And I have a presenter class
    When I include Catwalk
    Then my presenter should expose the models ActiveModel functionality
