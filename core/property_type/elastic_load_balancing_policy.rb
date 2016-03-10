require_relative './base_property'
class ElasticLoadBalancingPolicy < BaseProperty
  attr_accessor :loadbalancerports, :instanceports, :policytype, :attributes, :policyname
  @attributes
  @instanceports
  @loadbalancerports
  @policyname
  @policytype
end

# test

# require 'json'
#
# my_hash = {:hello => "goodbye"}
# jsonTemplate=JSON.generate(my_hash)
# p jsonTemplate.class
# p jsonTemplate