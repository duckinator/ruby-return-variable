$: << File.join(File.dirname(__FILE__), 'lib')
require 'return_variable'
__END__

def foo
  return = 'test'
  puts "bam"
  return
end

puts foo
