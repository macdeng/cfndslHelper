require_relative './base_property'
class EC2Tag < BaseProperty
  attr_accessor :key, :value
  @key
  @value

  def initialize(key,value)
    @key = key
    @value = value
  end
end