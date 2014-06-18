# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

require 'benchmark'

def largest_three_digit_palindrome
  largest_pal = 0
  i = 999
  while i > 99
    new_pal = check_one_for_pals(i)
    unless new_pal.nil?
      largest_pal = new_pal if new_pal > largest_pal
    end
    i -= 1
  end
  largest_pal
end

def check_one_for_pals(n)
  i = 999
  while i > 0
    num_to_check = n * i
    return num_to_check if num_to_check.to_s == num_to_check.to_s.reverse
    i -= 1
  end
end

Benchmark.bm do |b|
  b.report { puts largest_three_digit_palindrome }
end
