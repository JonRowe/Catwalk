Feature: Presenting basic fields from an active model compatible model
  In order to seperate my presentation logic from my persistance models
  As a developer
  I want to wrap my models in a catwalk presenter

  @basic @field
  Scenario: Basic usage
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

        field :title
      end
      """
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should present "title" from my model
