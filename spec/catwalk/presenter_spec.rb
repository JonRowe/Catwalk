require 'spec_helper'

module Catwalk
  describe Presenter do

    let(:model) { mock "model" }
    let(:klass) { Class.new }
    let(:presenter) { klass.new(model) }

    before do
      klass.class_eval { include Catwalk::Presenter }
    end

    describe "initialization" do
      subject { presenter }

      it "should assign an the model to an instance variable accessible via to_model" do
        subject.to_model.should == model
      end
    end

    describe "field" do
      let(:model_value) { "a value" }

      before do
        model.stub(:a_field).and_return(model_value)
      end

      subject do
        klass.class_eval do
          field :a_field
        end
        presenter.a_field
      end

      it "should proxy field to model" do
        model.should_receive(:a_field).and_return(model_value)
        subject
      end
      it { should == model_value }
    end
  end
end
