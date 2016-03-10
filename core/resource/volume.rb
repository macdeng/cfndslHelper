require_relative './base_resource'
# volume
class Volume < BaseResource
  attr_accessor :tags, :volumetype, :snapshotid, :availabilityzone, :encrypted, :size, :iops
  @availabilityzone
  @size
  @snapshotid
  @tags
  @encrypted
  @iops
  @volumetype

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_VOLUME
  end
end