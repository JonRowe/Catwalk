module Catwalk
  module Presenter
    def self.included(base)
      base.send :extend, ClassMethods
    end

    def initialize(model)
      @model = model
    end

    define_method(:to_model)   { @model }
    define_method(:to_param)   { @model.to_param if persisted? }
    define_method(:to_key)     { @model.to_key   if persisted? }
    define_method(:persisted?) { @model.persisted? }
    define_method(:valid?)     { @model.valid? }
    define_method(:model_name) { @model.model_name }
    define_method(:errors)     { @model.errors }

    module ClassMethods

      def field(field_name)
        define_method field_name do
          @model.send field_name
        end
      end

    end
  end
end
