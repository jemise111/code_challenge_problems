# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

def smallest_divided
  start = 2520
  while true
    divisor = 11
    continue = true
    while continue
      continue = false if start % divisor != 0
      return start if divisor == 20
      divisor += 1
    end
    start += 20
  end
end

puts smallest_divided
