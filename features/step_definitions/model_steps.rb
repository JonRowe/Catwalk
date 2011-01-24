Given "I have an ActiveModel based model" do
  @model = ActiveModelExample.new
end

Given /^my model has an attribute named "([^"]*)"(?: with a value "([^"]*)")?$/ do |field_name,field_value|
  @model.class.class_eval do
    attr_accessor field_name
  end
  @model.send(:"#{field_name}=",field_value || "a value for checking later")
end

Given /^my model's "([^"]*)" attribute is nil$/ do |field_name|
  @model.send(:"#{field_name}=", nil)
end
