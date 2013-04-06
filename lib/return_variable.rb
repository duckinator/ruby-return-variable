#!/usr/bin/env ruby

$file = caller.last.split(':').first

require File.join(File.dirname(__FILE__), '..', 'lib', 'return_variable', 'version.rb')
require 'ruby2ruby'
require 'ruby_parser'
require 'pp'

class ReturnVariable
  def initialize(file)
    @file = file
    @code = open(file).read
    sexp = get_sexp
    @code = Ruby2Ruby.new.process(sexp)
    run_modified
  end

  def get_sexp
    sexp = RubyParser.new.parse @code
    sexp = __modify_sexp(sexp)
  end

  def __modify_sexp(sexp)
    ret = sexp.map do |x|
      if x.is_a?(Array)
        if x[0] == :gasgn && x[1] == :$return
          [:lasgn, :__return, *__modify_sexp(x[2..-1])]
        elsif x[0] == :return && !(x[1].is_a?(Array) && x[1][1] == [:lvar, :__return] && x[1][2][0..1] == [:lasgn, :__return])
          default =
            if x.length > 1
              [:lasgn, :__return, *x[1..-1]]
            else
              [:lasgn, :__return, [:nil]]
            end
          
          [:return,
           [:op_asgn_or,
            [:lvar, :__return],
            default]]

        elsif x[0] == :defn
          x +=  [[:return,
                  [:op_asgn_or,
                    [:lvar, :__return],
                    [:lasgn, :__return, [:nil]]]]]

          __modify_sexp(x)
        else
          __modify_sexp(x)
        end
      else
        x
      end
    end

    Sexp.from_array(ret)
  end

  def run_modified
    # $DONTMODIFY is to tell it to not modify the code.
    # This avoids recursively calling ReturnVariable.
    code = "$DONTMODIFY = true; " + @code

    eval code
    exit
  end
end

ReturnVariable.new($file) unless $DONTMODIFY

