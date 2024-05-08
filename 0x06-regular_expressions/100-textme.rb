#!/usr/bin/env ruby

sender = ARGV[0].scan(/from:(\w+|\+\d+)/).join
receiver = ARGV[0].scan(/to:(\+\d+)/).join
flags = ARGV[0].scan(/flags:(\-?\d+(?::\-?\d+)*)/).join

puts "#{sender},#{receiver},#{flags}"
