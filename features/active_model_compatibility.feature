Feature: Active Model compatibility
  In order to use presenters interchangably with active models
  As a developer
  I wish to use catwalk to present my models whilst adhering to ActiveModel::Lint

  @basic @model @active-model
  Scenario: Basic Active Model functionality
    Given I have an ActiveModel based model
      """
      class MyActiveModel < ActiveModelExample
      end
      """
    When I define a Catwalk presenter class for my model
      """
      class MyModelPresenter
        include Catwalk::Presenter
      end
      """
    When I set up my presenter for my model
      """
      @model = MyActiveModel.new
      @presenter = MyModelPresenter.new @model
      """
    Then my presenter should expose the models ActiveModel functionality
