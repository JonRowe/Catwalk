Given "I have a presenter class" do
  @presenter_klass = Class.new
end

Given "I have a Catwalk presenter class for my model" do
  klass = Class.new
  klass.send :include, Catwalk::Presenter
  @presenter = klass.new @model
end

When "I include Catwalk" do
  @presenter_klass.send :include, Catwalk::Presenter
end

When "I setup my presenter to represent my model" do
  @presenter = @presenter_klass.new(@model)
end

When /^I define a field "([^"]*)"$/ do |field_name|
  @presenter.class.class_eval do
    field field_name
  end
end

Then "my presenter should expose the models ActiveModel functionality" do
  @presenter.to_key.should == @model.to_key
  @presenter.to_param.should == @model.to_param
  @presenter.valid?.should == @model.valid?
  @presenter.persisted?.should == @model.persisted?
  @presenter.errors.should == @model.errors
  @presenter.to_model.should == @model
end

Then /^my presenter should present "([^"]*)" from my model$/ do |field_name|
  @presenter.send(field_name).should == @model.send(field_name)
end
