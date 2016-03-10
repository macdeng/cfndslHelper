require_relative './base_resource'
# Security Group
class SG < BaseResource
  attr_accessor :tags, :groupdescription, :vpcid
  @groupdescription
  @vpcid
  @tags

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_SECURITYGROUP
  end
end