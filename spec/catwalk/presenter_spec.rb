require 'spec_helper'

module Catwalk
  describe Presenter do

    let(:model) { double "model" }
    let(:klass) { Class.new }
    subject(:presenter) { klass.new(model) }

    before do
      klass.class_eval { include Catwalk::Presenter }
    end

    describe "initialization" do
      it "should assign an the model to an instance variable accessible via to_model" do
        presenter.to_model.should == model
      end
    end

    describe "active model compliance" do
      let(:model_name) { double 'model_name', :human => "Model Name", :singular => "model_name", :plural => "Model Names", :partial_path => '/model' }
      let(:active_model_errors) { double "errors", :full_messages => [], :[] => [] }
      let(:model) { double "model", :to_key => {}, :to_param => {}, :valid? => true, :persisted? => true, :model_name => model_name, :errors => active_model_errors }

      before do
        model_name.stub(:kind_of?).with(String).and_return(true)
      end

      it_should_behave_like "ActiveModel"
      it_should_behave_like "proxy active_model method", :to_key,     :from => :model
      it_should_behave_like "proxy active_model method", :to_param,   :from => :model
      it_should_behave_like "proxy active_model method", :valid?,     :from => :model
      it_should_behave_like "proxy active_model method", :persisted?, :from => :model
      it_should_behave_like "proxy active_model method", :model_name, :from => :model
      it_should_behave_like "proxy active_model method", :errors,     :from => :model
      its(:to_model) { should == model }
    end

    describe "access_as" do
      it "adds an accessors with the specified name" do
        klass.class_eval do
          access_as :model_accessor
        end
        presenter.should == model
      end
    end

    describe "field" do
      let(:model_value) { "a value" }

      before do
        model.stub(:a_field).and_return(model_value)
        klass.class_eval do
          field :a_field
        end
      end

      it "should proxy field to model" do
        model.should_receive(:a_field).and_return(model_value)
        presenter.a_field.should eq model_value
      end

      context "when default_when is specified" do
        before do
          model_value.stub(:method_is_true).and_return(false)
          klass.class_eval do
            field :a_field, :default_when => :method_is_true
          end
        end

        it "should check wether method passes on field" do
          model_value.should_receive(:method_is_true).and_return false
          presenter.a_field
        end

        context "and default_when check fails" do
          before do
            model_value.stub(:method_is_true).and_return true
          end

          it { should == "Not Set" }
        end
      end

      context "when format_with block is specified" do
        let(:formatted_value) { "nicer value" }

        before do
          model_value.stub(:my_format_method).and_return formatted_value
          klass.class_eval do
            field :a_field, :format_with => lambda { |field| field.my_format_method }
          end
        end

        it "should format the field with the block" do
          model_value.should_receive(:my_format_method).and_return formatted_value
          presenter.a_field.should eq formatted_value
        end
      end
    end
  end
end
