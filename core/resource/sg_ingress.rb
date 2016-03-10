require_relative './base_resource'
# the Ingress of Security Group
class SGIngress < BaseResource
  attr_accessor :groupid, :fromport, :sourcesecuritygroupname, :ipprotocol, :groupname, :sourcesecuritygroupid, :sourcesecuritygroupownerid, :toport, :cidrip
  @groupname
  @groupid
  @ipprotocol
  @cidrip
  @sourcesecuritygroupname
  @sourcesecuritygroupid
  @sourcesecuritygroupownerid
  @fromport
  @toport

  def initialize
    @type = GluCfn::AwsType::AWS_EC2_SECURITYGROUPINGRESS
  end
end