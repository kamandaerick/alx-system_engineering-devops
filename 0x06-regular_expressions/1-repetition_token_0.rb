#!/usr/bin/env ruby
#This script matches repetitive cases
puts ARGV[0].scan(/hbt{2,5}n/).join
