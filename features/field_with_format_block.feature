Feature: Field with format block specified
  In order to format a field in a custom fashion
  As a developer
  I want to use a lambda to format a field

  @field @format @lambda
  Scenario:
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

        field :title, :format_with => lambda { |field| field.upcase }
      end
      """
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @model.title = 'all letters need to be uppercased'
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should present "title" as "ALL LETTERS NEED TO BE UPPERCASED"
