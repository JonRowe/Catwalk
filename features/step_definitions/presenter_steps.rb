When "I define a Catwalk presenter class for my model" do |code|
  eval code
end

When "I set up my presenter for my model" do |code|
  eval code
end

Then "my presenter should expose the models ActiveModel functionality" do
  @presenter.to_key.should == @model.to_key
  @presenter.to_param.should == @model.to_param
  @presenter.valid?.should == @model.valid?
  @presenter.persisted?.should == @model.persisted?
  @presenter.errors.should == @model.errors
  @presenter.to_model.should == @model
end

Then /^my presenter should expose the model via "([^"]*)"$/ do |field_name|
  @presenter.send(field_name).should == @model
end
