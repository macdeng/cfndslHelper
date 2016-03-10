require_relative './core/glu_cfn'

CloudFormation do

  AWSTemplateFormatVersion('2010-09-09')

  Description('sample')

  sg1 = SG.new
  sg1.name = 'sg1'
  sg1.groupdescription = 'this is a security group'
  tag1 = EC2Tag.new('name','sg1')
  tag2 = EC2Tag.new('function','ingress')
  sg1.vpcid = 'vpcid-214'
  sg1.tags = [tag1,tag2]
  createSG(sg1)
  # create an EC2 instance
  ec2 = EC2.new
  ec2.name = 'instance1'
  ec2.setDeletionPolicy('Retain')
  createEC2(ec2)
  # attach an elastic IP to ec2
  eip = EIP.new
  eip.name = 'eip1'
  eip.instanceid = Ref(ec2.name)
  createEIP(eip)
end
