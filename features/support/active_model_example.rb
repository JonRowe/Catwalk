require 'active_model'

class ActiveModelExample
	extend ActiveModel::Naming

	attr_reader :errors

	def initialize
		@errors = ActiveModel::Errors.new(self)
	end

	def to_model
		self
	end

	def to_key; {}; end
	def to_param; {}; end
	def valid?;      true; end
	def new_record?; true; end
	def destroyed?;  true; end
	def persisted?;  true; end
end

