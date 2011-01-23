module Catwalk
  module Presenter
    def self.included(base)
      base.send :extend, ClassMethods
    end

    def initialize(model)
      @model = model
    end

    def to_model
      @model
    end

    module ClassMethods

      def field(field_name)
        define_method field_name do
          @model.send field_name
        end
      end

    end
  end
end
