Then /^my presenter should present "([^"]*)" from my model$/ do |field_name|
  @presenter.send(field_name).should == @model.send(field_name)
end

Then /^my presenter should present "([^"]*)" as "([^"]*)"$/ do |field_name,value|
  @presenter.send(field_name).should == value
end
