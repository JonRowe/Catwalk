Feature: Field with default_when specified
  In order to prevent undesirable effects
  As a developer
  I want to specify a check to be performed when I access a field

  @default @field
  Scenario: default_when specified
    Given I have an ActiveModel based model
      """
      class MyActiveModel < ActiveModelExample
        attr_accessor :title
      end
      """
    When I define a Catwalk presenter class for my model
      """
      class MyModelPresenter
        include Catwalk::Presenter

        field :title, default_when: :nil?
      end
      """
    And I set it up to present my model
      """
      @model = MyActiveModel.new
      @model.title = 'a value'
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should present "title" from my model

  Scenario: default_when specified, and criteria matched
    Given I have an ActiveModel based model
    And my model has an attribute named "title"
    But my model's "title" attribute is nil
    And I have a Catwalk presenter class for my model
    When I define a field "title" with default_when: :nil?
    Then my presenter should present "title" as "Not Set"
