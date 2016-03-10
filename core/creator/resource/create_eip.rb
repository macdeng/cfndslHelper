require_relative '../../common/type/resource_property'
require_relative '../../resource/eip'
require_relative './resource_type_creator'

def createEIP(eip)
  # pre checks
  if(!eip.is_a?(EIP))
    raise('the input parameter should be of EIP type!')
  end
  if(!eip.name)
    raise('the name attribute should be specified!')
  end
  if(!eip.type)
    raise('the type attribute should be specified!')
  end
  if(!eip.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!eip.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(eip.name) do
    Type(eip.type)
    if(eip.getDeletionPolicy)
      DeletionPolicy(eip.getDeletionPolicy)
    end

    if eip.instanceid
      if(!(eip.instanceid.is_a?(CfnDsl::RefDefinition)||eip.instanceid.is_a?(String)))
        raise('the instanceid attribute should be of Ref or String type')
      end
      Property(GluCfn::ResourceProperty::INSTANCE_ID,eip.instanceid)
    end
    if eip.domain
      if(!eip.domain.is_a?(String))
        raise('the domain attribute should be of String type')
      end
      Property(GluCfn::ResourceProperty::DOMAIN,eip.domain)
    end
  end
end