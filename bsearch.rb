def bsearch(array, target)
  return nil if array.empty?

  midpoint = array.length / 2

  case target <=> array[midpoint]
  when -1
    bsearch(array[0..midpoint], target)
  when 0
    midpoint
  when 1
    bsearch(array.drop(midpoint), target) + midpoint
  end
end