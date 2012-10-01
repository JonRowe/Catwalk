Feature: Field with default_when specified
  In order to prevent undesirable effects
  As a developer
  I want to specify a check to be performed when I access a field

  Background:
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

        field :title, :default_when => :nil?
      end
      """

  @default @field
  Scenario: default_when specified
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @model.title = 'a value'
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should present "title" from my model

  @default @field @defaulted
  Scenario: default_when specified, and criteria matched
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @presenter = MyModelPresenter.new @model
      """
    But my model's "title" attribute is nil
    Then my presenter should present "title" as "Not Set"
