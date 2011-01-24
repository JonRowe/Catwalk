Feature: Field with default_when specified
	In order to prevent undesirable effects
	As a developer
	I want to specify a check to be performed when I access a field

	Scenario: default_when specified
		Given I have an ActiveModel based model
		And my model has an attribute named "title"
		And I have a Catwalk presenter class for my model
		When I define a field "title" with default_when: :nil?
		Then my presenter should present "title" from my model
	
	Scenario: default_when specified, and criteria matched
		Given I have an ActiveModel based model
		And my model has an attribute named "title"
		But my model's "title" attribute is nil
    And I have a Catwalk presenter class for my model
		When I define a field "title" with default_when: :nil?
		Then my presenter should present "title" as "Not Set"
