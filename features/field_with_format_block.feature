Feature: Field with format block specified
	In order to format a field in a custom fashion
	As a developer
	I want to use a lambda to format a field

	Scenario:
		Given I have an ActiveModel based model
		And my model has an attribute named "title" with a value "all letters need to be uppercased"
		And I have a Catwalk presenter class for my model
		When I define a field "title" with format_with: lambda { |field| field.upcase }
		Then my presenter should present "title" as "ALL LETTERS NEED TO BE UPPERCASED"
