Given "I have an ActiveModel based model" do |code|
  eval code
end

Given /^my model's "([^"]*)" attribute is nil$/ do |field_name|
  @model.send(:"#{field_name}=", nil)
end
