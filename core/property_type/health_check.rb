require_relative './base_property'
class HealthCheck < BaseProperty
  attr_accessor :healthy_threshold, :timeout, :unhealthy_threshold, :target, :interval
  @healthy_threshold
  @interval
  @target
  @timeout
  @unhealthy_threshold
end