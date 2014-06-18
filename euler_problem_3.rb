# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def get_factors(n)
  left = 1
  right = n
  lefts = []
  rights = []
  while left < right
    if right % left == 0
      right /= left
      lefts << left
      rights << right
      left += 1 if left == 1
    else
      left += 1
    end
  end
  [lefts, rights]
end

def get_largest_prime(n)
  lefts = get_factors(n).first
  rights = get_factors(n).last
  return rights.last if get_factors(rights.last).flatten.size == 2
  i = lefts.size - 1
  while i > 0
    if get_factors(lefts[i]).flatten.size == 2
      return lefts[i]
    else
      i -= 1
    end
  end
end

p get_largest_prime(600851475143)
