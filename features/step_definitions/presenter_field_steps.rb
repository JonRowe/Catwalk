When /^I define a field "([^"]*)"$/ do |field_name|
  @presenter.class.class_eval do
    field field_name
  end
end

When /^I define a field "([^"]*)" with default_when :(.*)$/ do |field_name,method|
	@presenter.class.class_eval do
		field field_name, default_when: method.to_sym
	end
end

Then /^my presenter should present "([^"]*)" from my model$/ do |field_name|
  @presenter.send(field_name).should == @model.send(field_name)
end

Then /^my presenter should present "([^"]*)" as "([^"]*)"$/ do |field_name,value|
  @presenter.send(field_name).should == value
end
