#!/usr/bin/env ruby
#This script finds names/phone numbers of sender, the receiver, and flags in a message
puts ARGV[0].scan(/\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/).join(',')
