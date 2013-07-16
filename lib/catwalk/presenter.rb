module Catwalk
  module Presenter
    def self.included(base)
      base.send :extend, ClassMethods
    end

    def initialize(model)
      @model = model
    end

    def to_model;   @model; end
    def to_param;   @model.to_param if persisted?; end
    def to_key;     @model.to_key   if persisted?; end
    def persisted?; @model.persisted?; end
    def valid?;     @model.valid?; end
    def model_name; @model.model_name; end
    def errors;     @model.errors; end

    module ClassMethods

      def field(field_name,opts={})
        define_method field_name do
          field_value = @model.send field_name
          default_when = opts[:default_when]

          if default_when && field_value.send(default_when)
            "Not Set"
          elsif opts[:format_with] && opts[:format_with].respond_to?(:call)
            opts[:format_with].call field_value
          else
            field_value
          end
        end
      end

      def access_as(accessor)
        define_method accessor do
          @model
        end
      end

    end
  end
end
