require_relative '../../common/type/resource_property'
require_relative '../../resource/ec2'
require_relative './resource_type_creator'

def createEC2(ec2)
  # pre checks
  if(!ec2.is_a?(EC2))
    raise('the input parameter should be of EC2 type!')
  end
  if(!ec2.name)
    raise('the name attribute should be specified!')
  end
  if(!ec2.type)
    raise('the type attribute should be specified!')
  end
  if(!ec2.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!ec2.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(ec2.name) do
    Type (ec2.type)
    if(ec2.getDeletionPolicy)
      DeletionPolicy(ec2.getDeletionPolicy)
    end

    if !ec2.ebsoptimized.is_a?(NilClass)
      if(!(ec2.ebsoptimized.is_a?(TrueClass)||ec2.ebsoptimized.is_a?(FalseClass)))
        raise('the ebsoptimized attribute should be of Boolean type!')
      end
      Property(GluCfn::ResourceProperty::EBS_OPTIMIZED,ec2.ebsoptimized)
    end
    if ec2.instanceinitiatedshutdownbehavior
      if(!ec2.instanceinitiatedshutdownbehavior.is_a?(String))
        raise('the instanceinitiatedshutdownbehavior attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::INSTANCE_INITIATED_SHUTDOWN_BEHAVIOR,ec2.instanceinitiatedshutdownbehavior)
    end
    if ec2.availabilityzone
      if(!ec2.availabilityzone.is_a?(String))
        raise('the availabilityzone attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::AVAILABILITY_ZONE,ec2.availabilityzone)
    end
    if ec2.disableapitermination
      if(!ec2.disableapitermination.is_a?(String))
        raise('the disableapitermination attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::DISABLE_API_TERMINATION,ec2.disableapitermination)
    end
    if ec2.iaminstanceprofile
      if(!ec2.iaminstanceprofile.is_a?(String))
        raise('the iaminstanceprofile attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::IAM_INSTANCE_PROFILE,ec2.iaminstanceprofile)
    end
    if ec2.imageid
      if(!ec2.imageid.is_a?(String))
        raise('the imageid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::IMAGE_ID,ec2.imageid)
    end
    if ec2.instancetype
      if(!ec2.instancetype.is_a?(String))
        raise('the instancetype attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::INSTANCE_TYPE,ec2.instancetype)
    end
    if ec2.kernelid
      if(!ec2.kernelid.is_a?(String))
        raise('the kernelid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::KERNEL_ID,ec2.kernelid)
    end
    if ec2.keyname
      if(!ec2.keyname.is_a?(String))
        raise('the keyname attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::KEY_NAME,ec2.keyname)
    end
    if ec2.monitoring
      if(!ec2.monitoring.is_a?(String))
        raise('the monitoring attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::MONITORING,ec2.monitoring)
    end
    if ec2.placementgroupname
      if(!ec2.placementgroupname.is_a?(String))
        raise('the placementgroupname attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::PLACEMENT_GROUP_NAME,ec2.placementgroupname)
    end
    if ec2.privateipaddress
      if(!ec2.privateipaddress.is_a?(String))
        raise('the privateipaddress attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::PRIVATE_IP_ADDRESS,ec2.privateipaddress)
    end
    if ec2.ramdiskid
      if(!ec2.ramdiskid.is_a?(String))
        raise('the ramdiskid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::RAM_DISK_ID,ec2.ramdiskid)
    end
    if ec2.securitygroups
      if(!ec2.securitygroups.is_a?(Array))
        raise('the securitygroups attribute should be of Array type!')
      end
      ec2.securitygroups.each do |securitygroup|
        if(!(securitygroup.is_a?(CfnDsl::RefDefinition)||securitygroup.is_a?(String)))
          raise('each securitygroup attribute should be of Ref or String type!')
        end
      end
      Property(GluCfn::ResourceProperty::SECURITY_GROUPS,ec2.securitygroups)
    end
    if ec2.securitygroupids
      if(!ec2.securitygroupids.is_a?(Array))
        raise('the securitygroupids attribute should be of Array type!')
      end
      ec2.securitygroupids.each do |securitygroupid|
        if(!(securitygroupid.is_a?(String)||securitygroupid.is_a?(CfnDsl::RefDefinition)))
          raise('each securitygroupid should be of String or Ref type!')
        end
      end
      Property(GluCfn::ResourceProperty::SECURITY_GROUP_IDS,ec2.securitygroupids)
    end
    if !ec2.sourcedestcheck.is_a?(NilClass)
      if(!(ec2.sourcedestcheck.is_a?(TrueClass)||ec2.sourcedestcheck.is_a?(FalseClass)))
        raise('the sourcedestcheck attribute should be of Boolean type!')
      end
      Property(GluCfn::ResourceProperty::SOURCE_DEST_CHECK,ec2.sourcedestcheck)
    end
    if ec2.subnetid
      if(!ec2.subnetid.is_a?(String))
        raise('the subnetid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::SUBNET_ID,ec2.subnetid)
    end
    if ec2.tags
      if(!ec2.tags.is_a?(Array))
        raise('the tags attribute should be of Array type!')
      end
      a_tags = Array.new
      ec2.tags.each do |tag|
        if(!tag.is_a?(EC2Tag))
          raise('each tag should be of EC2Tag type!')
        end
        a_tags.insert(-1,createTag(tag))
      end
      Property(GluCfn::ResourceProperty::TAGS,a_tags)
    end
    if ec2.tenancey
      if(!ec2.tenancey.is_a?(String))
        raise('the tenancey attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::TENANCEY,ec2.tenancey)
    end
    if ec2.userdata
      if(!ec2.userdata.is_a?(String))
        raise('the userdata attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::USER_DATA,ec2.userdata)
    end
  end
end

# test TODO
# b = false
#
# if (defined? b)
#   p 'defined1'
# end




