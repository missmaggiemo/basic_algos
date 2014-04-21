require_relative 'tree_node_class'

class TreeNode
  
  def bfs(value, queue = [])
    return self if self.value == value

    self.children.each {|child| queue << child }
    first_in_queue = queue.shift

    if first_in_queue.nil?
      return nil
    else
      first_in_queue.bfs(value, queue)
    end
  end
  
end