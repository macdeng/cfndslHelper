class BaseProperty
  # reset none empty instance variables
  def reset
    self.instance_variables.each do |name|
      instance_variable_set(name,NIL)
    end
  end
end