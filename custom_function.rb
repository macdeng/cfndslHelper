class Hash
  def compareHash(dest)
    src = self
    (src.keys | dest.keys).inject({}) do |diff, k|
      if src[k] != dest[k]
        if src[k].respond_to?(:compareHash) && dest[k].respond_to?(:compareHash)
          diff[k] = src[k].compareHash(dest[k])
        else
          diff[k] = [src[k], dest[k]]
        end
      end
      diff
    end
  end
end