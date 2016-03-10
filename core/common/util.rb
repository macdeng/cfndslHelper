''' @deprecated
module GluCfn
  module Util
    # iterates all instance variables and store the name/value pairs in a Hash
    def generateHash
      ret = Hash.new
      instance_variables.each do |name|
        ret[name]=instance_variable_get(name)
      end
      return ret
    end
  end
end
'''