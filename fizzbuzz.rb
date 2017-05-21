#!/usr/bin/env ruby

# (1..60).each do |num|
#   if num % 15 == 0
#     puts "fizzbuzz"
#   elsif num % 3 == 0
#     puts "fizz"
#   elsif num % 5 == 0
#     puts "buzz"
#   else
#     puts num
#   end
# end

1.upto(31) { |num| puts "#{'fizz' if num % 3 == 0}#{'buzz' if num % 5 == 0}#{num if num % 3 != 0 && num % 5 != 0}" }
