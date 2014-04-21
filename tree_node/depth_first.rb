require_relative 'tree_node_class'

# monkeypatch TreeNode
class TreeNode
  def dfs(target_val)
    return self if self.value == target_val

    self.children.each do |child|
      search = child.dfs(target_val)
      # if child has no children? && child.value != value
      # go back to parent and go to next child
      return search if search
    end
    nil
  end
end
