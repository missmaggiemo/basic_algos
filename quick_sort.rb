class Array
  def quick_sort!
    
    return self if self.length < 2
    
    pivot = self.shuffle.pop
    left = []
    right = []

    self.each do |el|
      left << el if el < pivot
      right << el if el > pivot
    end
    
    left.quick_sort! + [pivot] + right.quick_sort!
  end
  
end
