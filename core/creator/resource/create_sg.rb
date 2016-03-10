require_relative '../../common/type/resource_property'
require_relative '../../resource/sg'
require_relative './resource_type_creator'

def createSG(sg)
  # pre checks
  if(!sg.is_a?(SG))
    raise('the input parameter should be of SG type!')
  end
  if(!sg.name)
    raise('the name attribute should be specified!')
  end
  if(!sg.type)
    raise('the type attribute should be specified!')
  end
  if(!sg.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!sg.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(sg.name) do
    Type(sg.type)
    if(sg.getDeletionPolicy)
      DeletionPolicy(sg.getDeletionPolicy)
    end

    if sg.groupdescription
      if(!sg.groupdescription.is_a?(String))
        raise('the groupdescription attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::GROUP_DESCRIPTION,sg.groupdescription)
    end
    if sg.vpcid
      if(!sg.vpcid.is_a?(String))
        raise('the vpcid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::VPC_ID,sg.vpcid)
    end
    if sg.tags
      if(!sg.tags.is_a?(Array))
        raise('the tags attribute should be of Array type!')
      end
      a_tags = Array.new
      sg.tags.each do |tag|
        if(!tag.is_a?(EC2Tag))
          raise('each tag should be of EC2Tag type!')
        end
        a_tags.insert(-1,createTag(tag))
      end
      Property(GluCfn::ResourceProperty::TAGS,a_tags)
    end
  end
end