#!/usr/bin/env ruby

filename = ARGV.first

File.open("/tmp/rebaseface.lock", 'w') { |f| f.write(filename) }
puts "locked /tmp/rebaseface.lock"
until !File.exist?("/tmp/rebaseface.lock")
  #puts "locked /tmp/rebaseface.lock"
end

puts "unlocked"
