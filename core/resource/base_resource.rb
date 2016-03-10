# the base class for all master resources
class BaseResource
  attr_reader :type
  attr_accessor :name
  @name
  @type

  # resource attributes
  @creationpolicy
  @deletionpolicy
  @dependson
  @metadata
  @updatepolicy

  def initialize

  end

  # reset none empty instance variables
  def reset
    self.instance_variables.each do |name|
      if name!= :@type
        instance_variable_set(name,NIL)
      end
    end
  end

  def setCreationPolicy(creationPolicy)
    @creationpolicy = creationPolicy
  end

  def setDeletionPolicy(deletionPolicy) # TODO
    @deletionpolicy = deletionPolicy
  end

  def setDependsOn(dependsOn) # TODO
    @dependson = dependsOn
  end

  def setMetadata(metadata) # TODO
    @metadata = metadata
  end

  def setUpdatePolicy(updatePolicy) # TODO
    @updatepolicy = updatePolicy
  end

  def getCreationPolicy # TODO
    return @creationpolicy
  end

  def getDeletionPolicy
    return @deletionpolicy
  end

  def getDependsOn # TODO
    return @dependson
  end

  def getMetadata # TODO
    return @metadata
  end

  def getUpdatePolicy # TODO
    return @updatepolicy
  end
end