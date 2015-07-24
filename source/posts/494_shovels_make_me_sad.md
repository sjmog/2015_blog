# Shovels make me sad

Ruby's shovel operator is for mutating stuff, right? Except Fixnums can't be mutated like that...but they shovel anyway.

### The Shovel

Not familiar with the `<<` ('shovel') operator?

```
string_a = "Hello"
string_b = " World"

string_a << string_b  # => "Hello World"

# Look! The shovel mutated string_a!
string_a              # => "Hello World"
```

So shovels tend to mutate stuff, 'in-place'.

### The Fixnum

There is only one `Fixnum` instance for any given integer value (each instance has an `object_id` equal to the integer value * 2 + 1). Therefore, you'd expect `<<` to fail on Fixnum instances, because you can't mutate an object into another object:

```
# This should definitely not work
1.object_id   # => 3
1 << 1        # => 2 :(

# So I guess this should happen instead
1 << 1        # => NoMethodError '<<' for Fixnum
```

This should happen because `<<` should be universally understood to be a mutation operator. BUT, in the case of `Fixnum`s:

```
1 << 1        # => 2
```

_and_ the `<<` doesn't change the state of the `Fixnum` (we knew it couldn't for the reasons above).

### The Call to Action

Why is this? Can I propose that Ruby stops having `Fixnum` respond to `<<` in this way? It's upsetting my sense of consistency when using `<<`. I feel like an Exception would be more appropriate.



