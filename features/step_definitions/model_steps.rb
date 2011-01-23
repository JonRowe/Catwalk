Given "I have an ActiveModel based model" do
  @model = ActiveModelExample.new
end

Given /^my model has a attribute named "([^"]*)"$/ do |field_name|
  @model.class.class_eval do
    define_method(field_name) { "a value for checking later" }
  end
end
