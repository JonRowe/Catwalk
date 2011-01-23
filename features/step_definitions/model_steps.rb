require 'active_model'

Given "I have an ActiveModel based model" do
  klass = Class.new
  klass.class_eval do
    include ActiveModel
  end
  @model = klass.new
end

Given /^my model has a attribute named "([^"]*)"$/ do |field_name|
  @model.class.class_eval do
    attr_accessor :"#{field_name}"
  end
  @model.send(:"#{field_name}=","a value for checking later")
end
