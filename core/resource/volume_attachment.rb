require_relative './base_resource'
# attach volume to specific instance
class VolumeAttachment < BaseResource
  attr_accessor :instanceid, :volumeid, :device
  @instanceid
  @volumeid
  @device

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_VOLUMEATTACHMENT
  end
end