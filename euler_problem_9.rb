# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def pythag_triple_equals(max)
  (1..max).each do |first|
    (first..max).each do |second|
      (second..max).each do |third|
        if (first * first) + (second * second) == (third * third)
          return first * second * third if first + second + third == max
        end
      end
    end
  end
end

puts pythag_triple_equals(1000)
