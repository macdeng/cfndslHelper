require_relative './base_property'
class Listener < BaseProperty
  attr_accessor :instanceport, :loadbalancerport, :sslcertificateid, :instanceprotocol,
                :protocol, :policynames
  @instanceport
  @instanceprotocol
  @loadbalancerport
  @protocol
  @sslcertificateid
  @policynames
end