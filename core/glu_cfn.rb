########################################################################
#
# @Description: Entrance for all
#
# @Usage:
# require_relative '$YOUR_PATH/core/glu_cfn'
# CloudFormation do
#   AWSTemplateFormatVersion('2010-09-09')
#
#   Description('sample')
#
#   # create an EC2 instance
#   ec2 = EC2.new
#   ec2.name = 'instance1'
#   createEC2(ec2)
#   # attach an elastic IP to ec2
#   eip = EIP.new
#   eip.name = 'eip1'
#   eip.instanceid = Ref(ec2.name)
#   createEIP(eip)
# end
#
# @Author: Hao Deng (hao.deng@glu.com)
#
########################################################################

require_relative './resource/elb'

require_relative './creator/creator'

require_relative './common/type/instance_type'
require_relative './common/type/aws_type'
require_relative './common/type/resource_property'