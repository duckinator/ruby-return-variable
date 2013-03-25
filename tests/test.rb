#!/usr/bin/env ruby-return-variable

def foo
  return = 'test'
  puts "bam"
  return
end

puts foo
