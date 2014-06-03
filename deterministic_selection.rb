# deterministic selection of pivot point for finding the median

require_relative 'merge_sort'

def choose_pivot(array)
  medians = []
  counter = 0
  
  while counter < array.length
    new_arr = merge_sort(array[counter, 5])
    medians << new_arr[new_arr.length / 2]
    counter += 5
  end
 
  pivot_el = d_select(medians, medians.length / 2)
  
  medians.each_with_index do |el, i|
    return i if el == pivot_el
  end
  
end

def d_select(array, order_i)
  return array[0] if array.length == 1
  
  pivot_i = choose_pivot(array)
      
  array[pivot_i], array[0] = array[0], array[pivot_i] unless pivot_i == 0
    
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
    d_select(array[0..left_count], order_i)
  else
    d_select(array[(left_count + 1)..-1], order_i - (left_count + 1))
  end
  
end
