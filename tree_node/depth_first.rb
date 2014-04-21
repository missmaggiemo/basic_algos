require_relative 'tree_node_class'

# monkeypatch TreeNode
class TreeNode
  def dfs(val)
    return self if self.value == val

    self.children.each do |child|
      search = child.dfs(val)
      # if child has no children? && child.value != value
      # go back to parent and go to next child
      return search if search
    end
    nil
  end
end
