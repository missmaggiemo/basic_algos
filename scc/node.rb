class Node
  
  def initialize(name, out_array=[], in_array=[])
    @name = name
    @out_edges = out_array || []
    @in_edges = in_array || []
    @explored = false
    @order_label = nil
    @leader = nil
  end
  
  def explored=(bool)
    @explored = bool
  end

  def explored?
    @explored
  end
  
  def name
    @name
  end

  def out_edges
    @out_edges
  end
  
  def in_edges
    @in_edges
  end

  def out_edges=(arr)
    @out_edges = arr
  end
  
  def in_edges=(arr)
    @in_edges = arr
  end

  
  def order_label=(int)
    @order_label = int
  end

  def order_label
    @order_label
  end
  
  def leader=(node_name)
    @leader = node_name
  end

  def leader
    @leader
  end

end


