require_relative './base_resource'
# elastic IP
class EIP < BaseResource
  attr_accessor :instanceid, :domain
  @instanceid
  @domain

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_EIP
  end
end