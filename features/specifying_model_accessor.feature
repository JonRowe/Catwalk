Feature: Specifying model accessor
  In order to access the underlying model in my presenter methods
  As a developer
  I want to specify an accessor I will use to access the undelying model

  @model @access
  Scenario: Specifiying accessor
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

        access_as :my_model
      end
      """
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should expose the model via "my_model"
