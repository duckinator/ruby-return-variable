#!/usr/bin/env ruby

$file = caller.last.split(':').first

require "return_variable/version"

class ReturnVariable
  def initialize(file)
    @file = file
    @code = open(file).read
    modify_code
    run_modified
  end

  def modify_code
    @code.gsub!(/return\s*=\s*/, '____return = ')
    @code.gsub!(/return\s*$/,    '____return ||= nil')

    @code.gsub!('__END__', '') # HACK
  end

  def run_modified
    # $DONTMODIFY is to tell it to not modify the code.
    # This avoids recursively calling ReturnVariable.
    code = "$DONTMODIFY = true; " + @code
puts code
puts '-----------------'
    eval code
    exit
  end
end

ReturnVariable.new($file) unless $DONTMODIFY

