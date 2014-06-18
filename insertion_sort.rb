require 'benchmark'

def insertion_sort(array)
  result_arr = []
  result_arr.push(array.shift)
  array.each do |el|
    i = result_arr.length - 1
    while i >= 0
      if el >= result_arr[i]
        result_arr.insert(i + 1, el)
        break
      end
      result_arr.unshift(el) if i == 0
      i -= 1
    end
  end
  result_arr
end

p insertion_sort([3, 9, -4, 6, 0, 6, 8, 1, 22, -4, 21])

# Test Efficiency
# -----------------

test_arr_1 = ('109480234028370573952320398457' * 10).split(//).map(&:to_i)
test_arr_2 = ('109480234028370573952320398457' * 100).split(//).map(&:to_i)
test_arr_3 = ('109480234028370573952320398457' * 1000).split(//).map(&:to_i)

puts Benchmark.measure { insertion_sort(test_arr_1) }
puts Benchmark.measure { insertion_sort(test_arr_2) }
puts Benchmark.measure { insertion_sort(test_arr_3) }
