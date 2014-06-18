# You are given the following information, but you may prefer to do some research for yourself.

# 1 Jan 1900 was a Monday.
# Thirty days has September,
# April, June and November.
# All the rest have thirty-one,
# Saving February alone,
# Which has twenty-eight, rain or shine.
# And on leap years, twenty-nine.

# A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
# How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?


def sundays
  days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  sunday_count = 0
  day_index = 2 # Jan 1 1901 was a Tuesday
  (1901..2000).each do |year|
    days_in_month[1] = 29 if leap_year?(year)
    days_in_month.each do |num_days|
      sunday_count += 1 if day_index == 0
      day_index = (day_index + num_days) % 7
    end
    days_in_month[1] = 28
  end
  sunday_count
end

def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end

puts sundays

