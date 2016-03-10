# CloudFormation
AWS CloudFormation is a json-based AWS infrastructure deployment solution.
# Cfndsl
cfndsl provides a Ruby-based DSL that helps you to write CloudFormation template more efficiently.
# glu_cfn
encapsulate over cfndsl which can help us write CloudFormation template more conveniently.
# Getting started
##### example.rb:
```ruby
require_relative './core/glu_cfn'

CloudFormation do

  AWSTemplateFormatVersion('2010-09-09')

  Description('sample')

  # create an EC2 instance
  ec2 = EC2.new
  ec2.name = 'instance1'
  createEC2(ec2)
  # attach an elastic IP to ec2
  eip = EIP.new
  eip.name = 'eip1'
  eip.instanceid = Ref(ec2.name)
  createEIP(eip)
end
```
##### generate CloudFormation template:
```sh
> cfndsl example.rb | json_pp > example.json
```
##### sample.json:
```json
{
   "Resources" : {
      "instance1" : {
         "Type" : "AWS::EC2::Instance"
      },
      "eip1" : {
         "Properties" : {
            "InstanceId" : {
               "Ref" : "instance1"
            }
         },
         "Type" : "AWS::EC2::EIP"
      }
   },
   "Description" : "sample",
   "AWSTemplateFormatVersion" : "2010-09-09"
}
```
# build-up
You can visit [here](http://deployment.awscn.glu.com:8000/job/IaC%20CloudFormation/) to build the image