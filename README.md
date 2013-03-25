# ReturnVariable

This is a quick experiment with altering ruby's syntax.

Allow `return = ...` to specify the return value for a later `return`.

If you have the following in `test.rb`:

```ruby
def foo
  return = 'test'
  puts "bam"
  return
end

puts foo
```

Then `ruby-return-variable test.rb` will run code equivalent to:

```ruby
def foo
  tmp = 'test'
  puts '"bam"
  return tmp
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'return_variable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install return_variable

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
