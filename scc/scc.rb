require_relative 'node'

nodes = {}

(1..9).to_a.each do |node_int|
  nodes[node_int] = Node.new(node_int)
end

edges = [[1, 4], [2, 8], [3, 6], [4, 7], [5, 2], [6, 9], [7, 1], [8, 5], [8, 6], [9, 7], [9, 3]]

edges.each do |edge|
  nodes[edge[0]].out_edges = nodes[edge[0]].out_edges + [edge[1]]
  nodes[edge[1]].in_edges = nodes[edge[1]].in_edges + [edge[0]]
end


# reverse

def dfs_loop_rev(nodes)
  
  # set vars
  $t = 0
  
  $ordered_nodes = []
  
  nodes.each do |name, node|
    node.explored = false
  end
  
  # iterate through nodes
  nodes.keys.reverse.each do |name|
    unless nodes[name].explored?
      dfs_rev(nodes, name)
    end
  end
  
end


def dfs_rev(nodes, name)

  stack = []
  
  nodes[name].explored = true
  
  stack << [nodes[name], false]

  until stack.empty?
    node, explored_children = stack.pop
    
    if explored_children
      $t += 1
      node.order_label = $t
      $ordered_nodes << node.name
    else
      stack.push([node, true])
      new_nodes = node.in_edges.map do |edge_name|
        [nodes[edge_name], false]
      end.select { |node, _| !node.explored? }.each do |node, _|
        node.explored = true
      end
      
      stack.concat(new_nodes)
    end  
  end
  
end





# dfs forward


def dfs_loop(nodes)
  
  # set vars

  $s = nil
  
  $edge_count = Hash.new(0)
  
  nodes.each do |name, node|
    node.explored = false
  end

  # iterate through nodes
  $ordered_nodes.reverse.each do |name|
    
    unless nodes[name].explored?
      $s = name
      dfs(nodes, name)
    end
    
  end
  
end

def dfs(nodes, name)

  stack = []
  
  stack << nodes[name]

  until stack.empty?
    if stack.last.explored?
      node = stack.pop
    else
      stack.last.explored = true 
      stack.last.leader = $s
      $edge_count[$s] += 1

      new_nodes = stack.last.out_edges.map do |edge_name| 
        nodes[edge_name]
      end.select { |node| !node.explored? }
      
      stack.concat(new_nodes)
    end  
  end
  
end



dfs_loop_rev(nodes)
 
p nodes.keys.map { |name| [nodes[name].name, nodes[name].order_label] }
 
# [[1, 7], [2, 2], [3, 4], [4, 8], [5, 1], [6, 5], [7, 9], [8, 3], [9, 6]]
 
dfs_loop(nodes)
 
p nodes.keys.map { |name| [nodes[name].name, nodes[name].leader] }.sort_by { |arr| arr[1] }
 
# [[1, 7], [4, 7], [7, 7], [2, 8], [8, 8], [5, 8], [6, 9], [3, 9], [9, 9]]
 
p $edge_count
 
# {7=>3, 9=>3, 8=>3}