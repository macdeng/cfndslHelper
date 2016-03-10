require_relative '../../common/type/resource_property'
require_relative '../../resource/volume_attachment'
require_relative './resource_type_creator'

def createVolumeAttachment(attachment)
  # pre checks
  if(!attachment.is_a?(VolumeAttachment))
    raise('the input parameter should be of VolumeAttachment type!')
  end
  if(!attachment.name)
    raise('the name attribute should be specified!')
  end
  if(!attachment.type)
    raise('the type attribute should be specified!')
  end
  if(!attachment.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!attachment.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(attachment.name) do
    Type(attachment.type)
    if(attachment.getDeletionPolicy)
      DeletionPolicy(attachment.getDeletionPolicy)
    end

    if attachment.instanceid
      if(!(attachment.instanceid.is_a?(CfnDsl::RefDefinition)||attachment.instanceid.is_a?(String)))
        raise('the instanceid attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::INSTANCE_ID,attachment.instanceid)
    end
    if attachment.volumeid
      if(!(attachment.volumeid.is_a?(CfnDsl::RefDefinition)||attachment.volumeid.is_a?(String)))
        raise('the volumeid attribute should be of Ref or String type!')
      end
      Property(GluCfn::ResourceProperty::VOLUME_ID,attachment.volumeid)
    end
    if attachment.device
      if(!attachment.device.is_a?(String))
        raise('the device attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::DEVICE,attachment.device)
    end
  end

end
