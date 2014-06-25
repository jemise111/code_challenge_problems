# An attempt to implement a binary search algorithm

require 'Benchmark'

def binarysearch(sorted_array, element)
  mid_index = (sorted_array.length / 2.0).floor
  element_to_check = sorted_array[mid_index]
  if element_to_check == element
    return true
  else
    if sorted_array.length == 1
      return false
    else
      element_to_check > element ? binarysearch(sorted_array[0..(mid_index - 1)], element) : binarysearch(sorted_array[(mid_index + 1)..(sorted_array.length - 1)], element)
    end
  end
end

a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

20.times do |i|
  puts "#{i} #{binarysearch(a, i)}"
end

# Test Time Complexity
# --------------------------

a2 = (0..1_000_000).to_a
a3 = (0..10_000_000).to_a
a4 = (0..100_000_000).to_a

puts Benchmark.measure { binarysearch(a2, 1) }
puts Benchmark.measure { binarysearch(a3, 1) }
puts Benchmark.measure { binarysearch(a4, 1) }
