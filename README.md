negator
=======

It's pronounced "NEG-a-tor".

```ruby
class Array
  include Negator
end

[].empty?      # => true
[].not_empty?  # => false
[1].not_empty? # => true
```
