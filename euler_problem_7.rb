# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
# What is the 10 001st prime number?

def nth_prime(n)
  # avoid starting at 0
  count = 1
  num_to_check = 3
  until count == n
    count += 1 if prime?(num_to_check)
    num_to_check += 2
  end
  num_to_check - 2
end

def prime?(n)
  max_to_check = n / 2 + 1
  (2..max_to_check).each do |i|
    return false if n % i == 0
  end
  true
end

puts nth_prime(10001)
