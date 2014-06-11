require_relative 'node'

class Dictionary
  def initialize(default = nil)
    @default = default
    @node = nil
  end
  
  def set(key, val)
    if @node.nil?
      @node = Node.new(key, val)
    else
      @node.set(key, val)
    end
  end

  def get(key)
    if @node
      @node.get(key) || @default
    end
  end
  
  def keys
    @node.keys if @node
  end
  
  def values
    @node.values if @node
  end
  
  def each(&prc)
    @node.each(&prc) if @node
  end
  
  def self.array_to_dict(array)
    array.shuffle.each_with_object(self.new) do |tuple, dict|
      dict.set(*tuple)
    end
  end

end
