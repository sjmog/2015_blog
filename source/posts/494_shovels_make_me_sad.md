# Shovels make me sad

Ruby's shovel operator is for mutating stuff, right? Except it isn't. The idea that << is an alias for concat() has outstripped its purpose as a bitwise operator, leading to confusion.

### The Shovel

Not familiar with the `<<` ('shovel') operator?

<pre>
  <code>
string_a = "Hello"
string_b = " World"

string_a << string_b  # => "Hello World"

# Look! The shovel mutated string_a!
string_a              # => "Hello World"
</code>
</pre>

So shovels tend to mutate stuff, 'in-place'.

### The confusion

There is only one `Fixnum` instance for any given integer value (each instance has an `object_id` equal to the integer value * 2 + 1). Therefore, you'd expect `<<` to fail on Fixnum instances, because you can't mutate an object into another object:

<pre>
  <code>
# This should definitely not work
1.object_id   # => 3
1 << 1        # => 2 :(
2 << 1        # => 4 !! :( :(

# So I guess this should happen instead
1 << 1        # => NoMethodError '<<' for Fixnum
</code>
</pre>

This 'should' happen because `<<` is [commonly understood](https://www.google.co.uk/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=shovel%20ruby) to be an alias for `concat()`. BUT, in the case of `Fixnum`s:

<pre>
  <code>
1 << 1        # => 2
2 << 1        # => 4
</code>
</pre>

not only does `<<` not change the state of the `Fixnum` (we knew it couldn't for the reasons above), it does extra-weird stuff. That's because its primary function is as a bitwise operator, shifting bits 'leftwards' by the value passed as an argument.

### Bitwise shovels

Bitwise operators work like this: convert the value to binary, and work on that. So:

<pre>
  <code>
    1.to_s(2)     # => "1" as a binary string
    1 << 1        # => 10 in binary, == 2 in decimal

    2.to_s(2)     # => "10" as a binary string
    2 << 1        # => 100 in binary, == 4 in decimal
  </code>
</pre>

There's also a `>>` operator, which goes the other way.

### Why I'm upset

Here's the [first page of Google results](https://www.google.co.uk/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=shovel%20ruby) for 'shovel ruby'. It's all about `<<` as an alias for `concat()`. So, the way it works with `Fixnum`s is very weird indeed. Until this was pointed out to me, I was awash with upset as to why `1.concat(1)` was returning `2`.

### The Call to Action

So what's the deal? Why is `<<` used as an alias like that?



