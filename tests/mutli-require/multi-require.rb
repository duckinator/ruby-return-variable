#!/usr/bin/env ruby

$: << File.join(File.dirname(__FILE__), '..', '..', 'lib')
require 'return_variable'
require './multi-require-required.rb'

def foo
  $return = 'foo (return)'
  puts "foo (puts)"
end

puts foo
