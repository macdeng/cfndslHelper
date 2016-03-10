require_relative '../../common/type/resource_property'
require_relative '../../resource/volume'
require_relative './resource_type_creator'

def createVolume(volume)
  # pre checks
  if(!volume.is_a?(Volume))
    raise('the input parameter should be of Volume type!')
  end
  if(!volume.name)
    raise('the name attribute should be specified!')
  end
  if(!volume.type)
    raise('the type attribute should be specified!')
  end
  if(!volume.name.is_a?(String))
    raise('the name attribute should be of String type!')
  end
  if(!volume.type.is_a?(String))
    raise('the type attribute should be of String type!')
  end

  Resource(volume.name) do
    Type(volume.type)
    if(volume.getDeletionPolicy)
      DeletionPolicy(volume.getDeletionPolicy)
    end

    if volume.availabilityzone
      if(!volume.availabilityzone.is_a?(CfnDsl::Fn))
        raise('the availabilityzone attribute should be of FnGetAtt type!')
      end
      Property(GluCfn::ResourceProperty::AVAILABILITY_ZONE,volume.availabilityzone)
    end
    if volume.size
      if(!volume.size.is_a?(String))
        raise('the size attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::SIZE,volume.size)
    end
    if volume.snapshotid
      if(!volume.snapshotid.is_a?(String))
        raise('the snapshotid attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::SNAPSHOT_ID,volume.snapshotid)
    end
    if volume.tags
      if(!volume.tags.is_a?(Array))
        raise('the tags attribute should be of Array type!')
      end
      a_tags = Array.new
      volume.tags.each do |tag|
        if(!tag.is_a?(EC2Tag))
          raise('each tag should be of EC2Tag type!')
        end
        a_tags.insert(-1,createTag(tag))
      end
      Property(GluCfn::ResourceProperty::TAGS,a_tags)
    end
    if !volume.encrypted.is_a?(NilClass)
      if(!(volume.encrypted.is_a?(TrueClass)||volume.encrypted.is_a?(FalseClass)))
        raise('the encrypted attribute should be of Boolean type!')
      end
      Property(GluCfn::ResourceProperty::ENCRYPTED,volume.encrypted)
    end
    if volume.iops
      if(!volume.iops.is_a?(Fixnum))
        raise('the iops attribute should be of Fixnum type!')
      end
      Property(GluCfn::ResourceProperty::IOPS,volume.iops)
    end
    if volume.volumetype
      if(!volume.volumetype.is_a?(String))
        raise('the volumetype attribute should be of String type!')
      end
      Property(GluCfn::ResourceProperty::VOLUME_TYPE,volume.volumetype)
    end
  end
end
