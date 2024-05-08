#!/usr/bin/env ruby
puts ARGV[0].scan(/127.0.0.[0-9]/).join

sender = ARGV[0].scan(/from:(\w+|\+\d+)/).join
receiver = ARGV[0].scan(/to:(\+\d+)/).join
flags = ARGV[0].scan(/flags:(\-?\d+(?::\-?\d+)*)/).join

puts "#{sender},#{receiver},#{flags}"
