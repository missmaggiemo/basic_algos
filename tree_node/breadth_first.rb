require_relative 'tree_node_class'

# monkeypatch TreeNode
class TreeNode
  def bfs(val, queue = [])
    return self if self.value == val

    self.children.each { |child| queue << child }
    first_in_queue = queue.shift

    if first_in_queue.nil?
      return nil
    else
      first_in_queue.bfs(val, queue)
    end
  end
end
