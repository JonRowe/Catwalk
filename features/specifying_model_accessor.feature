Feature: Specifying model accessor
	In order to access the underlying model in my presenter methods
	As a developer
	I want to specify an accessor I will use to access the undelying model

	Scenario: Specifiying accessor
		Given I have an ActiveModel based model
		And I have a Catwalk presenter class for my model
		When I set access_as to "my_model"
		Then my presenter should expose the model via "my_model"
