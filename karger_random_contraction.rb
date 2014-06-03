# the karger random contraction algorithm (http://en.wikipedia.org/wiki/Karger's_algorithm) finds a min cut (or at least a cut) of a graph by randomly merging nodes. the algortithm then returns the number of edges in that cut.

def random_contraction(adjacency_hash)
  
  # adjacency_hash is a hash of vertices where keys are vertex numbers and values are a list of integers denoting the other vertices that share an edge with the key vertex
  
  if adjacency_hash.length <= 2
    return adjacency_hash.values.first.length
  end
  
  # pick edge somewhat randomly
  
  random_vert = adjacency_hash.keys.sample
  
  next_vert = adjacency_hash[random_vert].sample
  
  # merge nodes
  adjacency_hash[next_vert] += adjacency_hash[random_vert]
  adjacency_hash.delete(random_vert)
  
  # delete self-loops
  adjacency_hash.keys.each do |key|
    adjacency_hash[key].map! { |el| el == random_vert ? next_vert : el }
    adjacency_hash[key].delete_if { |el| el == key }
  end

  random_contraction(adjacency_hash)
  
end
