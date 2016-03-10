require_relative './base_property'
class ConnectionSettings < BaseProperty
  attr_accessor :idletimeout
  @idletimeout

  def initialize(idletimeout)
      @idletimeout = idletimeout
  end
end