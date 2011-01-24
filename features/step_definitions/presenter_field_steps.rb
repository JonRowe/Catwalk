When /^I define a field "([^"]*)"$/ do |field_name|
  @presenter.class.class_eval do
    field field_name
  end
end

When /^I define a field "([^"]*)" with (.*)$/ do |field_name,expression|
	@presenter.class.class_eval <<-CODE, __FILE__, __LINE__
	  field :#{field_name}, #{expression}
	CODE
end

Then /^my presenter should present "([^"]*)" from my model$/ do |field_name|
  @presenter.send(field_name).should == @model.send(field_name)
end

Then /^my presenter should present "([^"]*)" as "([^"]*)"$/ do |field_name,value|
  @presenter.send(field_name).should == value
end
