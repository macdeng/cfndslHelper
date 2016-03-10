require_relative './base_resource'
# Elastic load balancer
class ELB < BaseResource
  attr_accessor :subnets, :policies, :instances, :listeners, :connectiondrainingpolicy,
                :healthcheck, :loadbalancername, :availabilityzones, :lbcookiestickinesspolicy,
                :securitygroups, :scheme, :connectionsettings, :appcookiestickinesspolicy,
                :crosszone
  @availabilityzones
  @crosszone
  @healthcheck
  @instances
  @listeners
  @appcookiestickinesspolicy
  @lbcookiestickinesspolicy
  @scheme
  @securitygroups
  @subnets
  @connectiondrainingpolicy
  @connectionsettings
  @loadbalancername
  @policies

  def initialize
    @type = GluCfn::AwsType::AWS_ELASTICLOADBALANCING_LOADBALANCER
  end
end
