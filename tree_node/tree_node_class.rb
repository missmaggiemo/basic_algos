# node class for creating trees
class TreeNode

  attr_accessor :parent, :children, :value

  def initialize(value, name = nil, parent = nil, children = [])
    @name = name
    @value = value
    @parent = parent
    @children = children
  end

  def to_s
    @value.to_s
  end

  def remove_node(child_node)
    child_node.parent = nil
    children.select! { |child| !child.parent.nil? } # remove child node
  end

  def add_node(child_node)
    child_node.parent = nil # remove child node from prev parent
    child_node.parent = self # set child's parent node to new node
    children << child_node # add child to parent node's children
  end

  def path
    queue = [self]
    path_list = [self]

    loop do
      first_in_queue = queue.shift
      break if first_in_queue.parent.nil?
      path_list << first_in_queue.parent
      queue << first_in_queue.parent
    end
    path_list.reverse
  end
end
