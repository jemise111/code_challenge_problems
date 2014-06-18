# Challenge from homepage of https://www.interviewcake.com

# I have an array stockPricesYesterday where:
# The indices are the time, as a number of minutes past trade opening time,
# which was 9:30am local time. The values are the price of Apple stock at
# that time, in dollars. For example, the stock cost $500 at 10:30am, so
# stockPricesYesterday[60] = 500. Write an efficient algorithm for computing
# the best profit I could have made from 1 purchase and 1 sale of 1 Apple
# stock yesterday. For this problem, we won't allow shorting - you must buy
# before you sell.

require 'Benchmark'

def optimal_profit(prices)
  initial_index = 0
  max_profit = 0
  while initial_index < prices.length
    (initial_index..(prices.length - 1)).each do |comparison_index|
      if prices[comparison_index] - prices[initial_index] > max_profit
        max_profit = prices[comparison_index] - prices[initial_index]
      end
    end
    initial_index += 1
  end
  max_profit
end

stock_prices_yesterday_1 = [540, 560, 541, 570, 505, 531, 470]
puts optimal_profit(stock_prices_yesterday_1)

def optimal_profit_2(prices)
  max_profit = 0
  initial_index = 1
  cur_min = prices[0]
  cur_max = prices[0]
  while initial_index < prices.length
    if prices[initial_index] > cur_max
      max_profit = prices[initial_index] - cur_min
    else
      if prices[initial_index] < cur_min
        cur_min = prices[initial_index]
      end
    end
    initial_index += 1
  end
  max_profit
end

stock_prices_yesterday_1 = [540, 560, 541, 570, 505, 531, 470]
puts optimal_profit_2(stock_prices_yesterday_1)

# Test Efficiency
# ------------------------

stock_prices_yesterday_2 =     (1..10).to_a
stock_prices_yesterday_3 =    (1..100).to_a
stock_prices_yesterday_4 =   (1..1000).to_a
stock_prices_yesterday_5 =  (1..10000).to_a

puts 'O(n^2)'
puts '------------'

puts Benchmark.measure { optimal_profit(stock_prices_yesterday_2) }
puts Benchmark.measure { optimal_profit(stock_prices_yesterday_3) }
puts Benchmark.measure { optimal_profit(stock_prices_yesterday_4) }
puts Benchmark.measure { optimal_profit(stock_prices_yesterday_5) }

puts 'O(n)'
puts '------------'

puts Benchmark.measure { optimal_profit_2(stock_prices_yesterday_2) }
puts Benchmark.measure { optimal_profit_2(stock_prices_yesterday_3) }
puts Benchmark.measure { optimal_profit_2(stock_prices_yesterday_4) }
puts Benchmark.measure { optimal_profit_2(stock_prices_yesterday_5) }
