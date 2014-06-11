class Node
  
  attr_accessor :key, :val, :left, :right
  
  def initialize(key, val, left = nil, right = nil)
    @key = key
    @val = val
    @left = left
    @right = right
  end
  
  def get(key)
    return self.val if key == self.key
    
    if key < self.key
      self.left.get(key) if self.left
    else
      self.right.get(key) if self.right
    end
  end

  
  def set(key, val)
    return self.val = val if key == self.key
    
    if key < self.key
      if self.left
        self.left.set(key, val)
      else
        self.left = Node.new(key, val)
      end
    else
      if self.right
        self.right.set(key, val)
      else
        self.right = Node.new(key, val)
      end
    end
  end
  
  def flatten
    return [self] if self.right.nil? && self.left.nil?
    
    if self.right && self.left
      return self.left.flatten + [self] + self.right.flatten
    elsif self.left
      return self.left.flatten +[self]
    elsif self.right
      return [self] + self.right.flatten
    end    
  end

  
  def keys
    self.flatten.map(&:key)
  end

  def values
    self.flatten.map(&:val)
  end

  def each(&prc)
    items = self.flatten.map {|node| [node.key, node.val]}
    items.each do |node_arr|
      prc.call(*node_arr)
    end
    return self
  end
  
  def min
    return self if self.left.nil?
    self.left.min
  end

  def max
    return self if self.right.nil?
    self.right.max
  end

  def remove(key)
    if self.left.key == key
      node = self.left
      if node.left.nil? && node.right.nil?
        self.left = nil
        return node.val
      elsif node.right.nil?
        self.left = node.left
        return node.val
      elsif node.left.nil?
        self.left = node.right
        return node.val
      else
        self.left = node.left.max
        node.left.remove(self.left.key)
        self.left.left = node.left
        self.left.right = node.right
      end
    end
    if self.right.key == key
      node = self.right
      if node.left.nil? && node.right.nil?
        self.right = nil
        return node.val
      elsif node.right.nil?
        self.right = node.left
        return node.val
      elsif node.left.nil?
        self.right = node.right
        return node.val
      else
        self.right = node.left.max
        node.left.remove(self.right.key)
        self.right.left = node.left
        self.right.right = node.right
      end
    end    
    
    if self.key < key
      self.left.remove(key)
    else
      self.right.remove(key)
    end
  end
  
end