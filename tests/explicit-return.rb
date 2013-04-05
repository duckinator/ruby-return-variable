#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), '..', 'lib')
require 'return_variable'

def foo
  $return = 'test'
  puts "bam"
  return
end

puts foo
