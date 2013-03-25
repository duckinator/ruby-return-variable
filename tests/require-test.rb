$: << File.join(File.dirname(__FILE__), 'lib')
require 'return_variable'

# The __END__ is to avoid a parse error on `return = 'test'`.
__END__


def foo
  return = 'test'
  puts "bam"
  return
end

puts foo
