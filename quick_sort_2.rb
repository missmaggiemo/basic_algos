# this implementation of quicksort also couunts the comparisons that the algorithm makes as it swaps elements

# choose the median of three elements
def choose_pivot(array)
  a, b, c = array[0], array[array.length / 2], array[-1]
  return 0 if (b <= a && a <= c) || (c <= a && a <= b)
  return array.length - 1 if (b <= c && c <= a) || (a <= c && c <= b)
  return array.length / 2 if (c <= b && b <= a) || (a <= b && b <= c)
end


def q_sort(array, compare = 0)
  return array, compare if array.length <= 1
  
  # choose pivot
  pivot_i = choose_pivot(array)

  # switch pivot position to first position in array if it isn't already
  array[pivot_i], array[0] = array[0], array[pivot_i] unless pivot_i == 0
  
  i = j = 1
  
  while j < array.length
    compare += 1
    if array[j] < array[0]
      array[i], array[j] = array[j], array[i]
      i += 1
    end
    j += 1
  end  
  
  left, left_count = q_sort(array[1..(i - 1)])
  right, right_count = q_sort(array[i...array.length])
  
  return left + [array[0]] + right, left_count + compare + right_count
end

