require_relative 'tree_node_class'

# monkeypatch TreeNode
class TreeNode
  def bfs(target_val, queue = [])
    return self if self.value == target_val

    self.children.each { |child| queue << child }
    first_in_queue = queue.shift

    if first_in_queue.nil?
      return nil
    else
      first_in_queue.bfs(target_val, queue)
    end
  end
end
