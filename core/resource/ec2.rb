require_relative './base_resource'
# EC2 instance
class EC2 < BaseResource
  attr_accessor :iaminstanceprofile, :placementgroupname, :sourcedestcheck, :tags, :ramdiskid, :kernelid, :subnetid, :disableapitermination, :securitygroups, :ebsoptimized, :securitygroupids, :instanceinitiatedshutdownbehavior, :tenancey, :userdata, :keyname, :availabilityzone, :imageid, :instancetype, :monitoring, :privateipaddress
  @ebsoptimized
  @instanceinitiatedshutdownbehavior
  @availabilityzone
  @disableapitermination
  @iaminstanceprofile
  @imageid
  @instancetype
  @kernelid
  @keyname
  @monitoring
  @placementgroupname
  @privateipaddress
  @ramdiskid
  @securitygroups
  @securitygroupids
  @sourcedestcheck
  @subnetid
  @tags
  @tenancey
  @userdata
  # @blockdevicemappings
  # @networkinterfaces
  # @volumes

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_INSTANCE
  end
end