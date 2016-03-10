require_relative '../../common/type/resource_property'
require_relative '../../resource/sg_ingress'
require_relative './resource_type_creator'

def createSGIngress(sgingress)
  # pre checks
  if(!sgingress.is_a?(SGIngress))
    raise('the input parameter should be of SGIngress type!')
  end
  if(!sgingress.name)
    raise('the name attribute should be specified!')
  end
  if(!sgingress.type)
    raise('the type attribute should be specified!')
  end
  if(!sgingress.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!sgingress.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(sgingress.name) do
    Type(sgingress.type)
    if(sgingress.getDeletionPolicy)
      DeletionPolicy(ec2.getDeletionPolicy)
    end

    if sgingress.groupname
      if(!(sgingress.groupname.is_a?(CfnDsl::RefDefinition)||sgingress.groupname.is_a?(String)))
        raise('the groupname attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::GROUP_NAME,sgingress.groupname)
    end
    if sgingress.groupid
      if(!(sgingress.groupid.is_a?(CfnDsl::RefDefinition)||sgingress.groupid.is_a?(String)))
        raise('the groupid attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::GROUP_ID,sgingress.groupid)
    end
    if sgingress.ipprotocol
      if(!sgingress.ipprotocol.is_a?(String))
        raise('the ipprotocol attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::IP_PROTOCOL,sgingress.ipprotocol)
    end
    if sgingress.cidrip
      if(!sgingress.cidrip.is_a?(String))
        raise('the cidrip attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::CIDR_IP,sgingress.cidrip)
    end
    if sgingress.sourcesecuritygroupname
      if(!(sgingress.sourcesecuritygroupname.is_a?(CfnDsl::RefDefinition)||sgingress.sourcesecuritygroupname.is_a?(String)))
        raise('the sourcesecuritygroupname attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::SOURCE_SECURITY_GROUP_NAME,sgingress.sourcesecuritygroupname)
    end
    if sgingress.sourcesecuritygroupid
      if(!(sgingress.sourcesecuritygroupid.is_a?(CfnDsl::RefDefinition)||sgingress.sourcesecuritygroupid.is_a?(String)))
        raise('the sourcesecuritygroupid attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::SOURCE_SECURITY_GROUPID,sgingress.sourcesecuritygroupid)
    end
    if sgingress.sourcesecuritygroupownerid
      if(!(sgingress.sourcesecuritygroupownerid.is_a?(CfnDsl::RefDefinition)||sgingress.sourcesecuritygroupownerid.is_a?(String)))
        raise('the sourcesecuritygroupownerid attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::SOURCE_SECURITY_GROUPOWNER_ID,sgingress.sourcesecuritygroupownerid)
    end
    if sgingress.fromport
      if(!sgingress.fromport.is_a?(Fixnum))
        raise('the fromport attribute should be of Fixnum type!')
      end
      Property(GluCfn::ResourceProperty::FROM_PORT,sgingress.fromport.to_s)
    end
    if sgingress.toport
      if(!sgingress.toport.is_a?(Fixnum))
        raise('the toport attribute should be of Fixnum type!')
      end
      Property(GluCfn::ResourceProperty::TO_PORT,sgingress.toport.to_s)
    end


  end
end