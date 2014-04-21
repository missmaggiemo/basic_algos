require_relative 'tree_node_class'

class TreeNode
  
  def dfs(value)
    return self if self.value == value

    self.children.each do |child|
      search = child.dfs(value)
      # child has no children? && child.value != value go back to parent and go to next child
      return search if search
    end
    nil
  end
  
end
