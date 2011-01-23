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

    describe "active model compliance" do
      let(:model_name) { mock 'model_name', human: "Model Name", singular: "model_name", plural: "Model Names", partial_path: '/model' }
      let(:active_model_errors) { mock "errors", full_messages: [], :[] => [] }
      let(:model) { mock "model", to_key: {}, to_param: {}, valid?: true, persisted?: true, model_name: model_name, errors: active_model_errors }

      before do
        model_name.stub(:kind_of?).with(String).and_return(true)
      end
      subject { presenter }

      it_should_behave_like "ActiveModel"
      it_should_behave_like "proxy active_model method", :to_key,     from: :model
      it_should_behave_like "proxy active_model method", :to_param,   from: :model
      it_should_behave_like "proxy active_model method", :valid?,     from: :model
      it_should_behave_like "proxy active_model method", :persisted?, from: :model
      it_should_behave_like "proxy active_model method", :model_name, from: :model
      it_should_behave_like "proxy active_model method", :errors,     from: :model
      its(:to_model) { should == model }
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
