# random selection for finding the median

def r_select(array, order_i)
  return array[0] if array.length == 1
    
  # start counters
  left_count = right_count = 0
  
  while left_count + right_count + 1 < array.length
    pivot = array[left_count]
    next_el = array[left_count + right_count + 1]
    if pivot <= next_el
      right_count += 1
      next
    end
    
    # three-fold exchange-- che fancy!
    array[left_count] = next_el
    array[left_count + right_count + 1] = array[left_count + 1]
    array[left_count + 1] = pivot
    left_count += 1
  end
    
  if left_count == order_i - 1
    return array[left_count]
  elsif left_count > order_i - 1
    r_select(array[0..left_count], order_i)
  else
    r_select(array[(left_count + 1)..-1], order_i - (left_count + 1))
  end
  
end
