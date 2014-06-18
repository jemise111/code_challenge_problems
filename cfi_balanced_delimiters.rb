# A balanced delimiter string starts with an opening character ((, [, {),
# ends with a matching closing character (), ], } respectively), and in our
# case has only other matching delimiters in between. A balanced delimiter
# string may contain any number of balanced delimiters.
# The following are examples of balanced delimiter strings:
# (){}, ([{}]), ({})
# The following are examples of invalid strings:
# ([)], (, ), ([})
# Input is provided as a single string. Your output should be True or False
# according to whether the string is balanced. For example:
# Input:
# ([{}])
# Output:
# True
# Input Format and Restrictions
# Each test case will consist of a string containing only the characters (){}.
# The length of the string will not exceed 2KB.

require 'Benchmark'

def balanced_delimiters?(text)
  openers = []
  matchers = {
    ')' => '(',
    ']' => '[',
    '}' => '{'
  }
  text.chars.each do |char|
    if matchers.values.include?(char)
      openers.push(char)
    else
      if openers.last == matchers[char]
        openers.pop
      else
        return false
      end
    end
  end
  openers.empty?
end

# Sample Test Cases
# ------------------

test_text = ['(){}', '([{}])', '({})', '([)]', '(', ')', '([})']

test_text.each do |test|
  puts balanced_delimiters?(test)
end

# Test Time Complexity
# ---------------------

test_text_2 = '({{([])}})' * 1_000
test_text_3 = '({{([])}})' * 10_000
test_text_4 = '({{([])}})' * 100_000

puts Benchmark.measure { balanced_delimiters?(test_text_2) }
puts Benchmark.measure { balanced_delimiters?(test_text_3) }
puts Benchmark.measure { balanced_delimiters?(test_text_4) }
