# spec/support/active_model_lint.rb
# adapted from rspec-rails: http://github.com/rspec/rspec-rails/blob/master/spec/rspec/rails/mocks/mock_model_spec.rb

shared_examples_for "ActiveModel" do

  it { should respond_to :to_key }
  it { should respond_to :to_param }
  it { should respond_to :valid? }
  it { should respond_to :persisted? }
  it { should respond_to :model_name }
  it { should respond_to :errors }
  it { should respond_to :to_model }

  its(:"model_name")              { should be_a String }
  its(:"model_name.human")        { should be_a String }
  its(:"model_name.partial_path") { should be_a String }
  its(:"model_name.singular")     { should be_a String }
  its(:"model_name.plural")       { should be_a String }

  its(:"errors.full_messages") { should be_a Array }
  it "should have blank arrays for keys" do
    subject.errors[:hello].should == []
  end

  context "where not persisted" do
    before do
      subject.stub(:persisted?).and_return(false)
    end

    its(:to_key)   { should be_nil }
    its(:to_param) { should be_nil }
  end
end
