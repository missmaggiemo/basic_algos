def fibo_arr(n)
  return [0] if n == 1
  return [0, 1] if n == 2

  prev = fibo_arr(n - 1)
  prev << prev[-1] + prev[-2]
end


