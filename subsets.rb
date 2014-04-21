def subsets(arr)
  return [arr] if arr.empty?

  first = subsets(arr[0...-1])
  new_arr = first.map {|set| set + [arr[-1]]}
  (first + new_arr).uniq
end
