class CloudComponent < ApplicationRecord
  belongs_to :product
  validates_presence_of :config

  serialize :config

  after_initialize :set_default_values

  def pretty_name
  	name = 'Undefined component'
  	name
  end

  def pretty_size
  	"Undefined"
  end

  def self.types
  	%w(OracleDatabaseComponent)
	end

	def self.create_attributes
		{}
	end

  private

  def set_default_values
    self.config ||= {}
  end
end