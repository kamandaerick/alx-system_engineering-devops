#!/usr/bin/env ruby
#This script matches repetitive cases
puts ARGV[0].scan(/hb{0,1}tn/).join
