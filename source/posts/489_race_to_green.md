# Novice TDD: Race to Green

'Red, Green, Refactor': that's a helpful mantra for writing your code test-first. But how long should you spend on each stage, and how can you effectively separate each stage from the other? The answer: Make it Work, then Make it Good.

### Race to Green

> Race to Green. Worry about design later.

When you're starting out with Test-Driven Development, it's hard. Why? Because TDD demands you do two things in an unpleasant order: *Design* and *Implement*. These are two pretty different mindsets, and messing them together can get you into tangles.

To start out, I advise that you strongly separate the two. When you're writing your first test, think *Design*. How do I want this to work? What should my interface look like?

For example: let's say we want to write a simple program that allows Superheroes to fight each other. We can worry about the specifics later. For now, let's start from _Designing an Interface_ to your program:

<pre>
  <code>
  # Make a couple of superheroes
  batman = Superhero.new('Batman', 2)
  superman = Superhero.new('Superman', 5)

  # Make them fight each other
  batman.fight(superman) # => returns superman
  superman.fight(batman) # => returns superman
  </code>
</pre>

Now I've defined my interface, I can write a test that simulates this. Here, I can write a *Unit Test* that describes the scenario, because the scenario only involves one class (`Superhero`).

Once I have a failing test - failing because I haven't implemented the `#fight` method yet, say – I need to move to the next stage: Race to Green. Here's the principle:

> When Racing to Green, forget about principles of good design: Single Responsibility, Laws of Demeter, and so on. Just make it work, any way you can.

Here's me Racing to Green here:

<pre>
  <code>
  class Superhero
    attr_reader :power

    def initialize(name, power)
      # Only need power here to go green
      @power = power
    end

    def fight(other)
      return self if power > other.power
      other
    end
  end
  </code>
</pre>

### Refactor

Now that I've gone green in the fastest, simplest way I can, I can think about design.

> The best bit about Racing to Green? Now I can mess with my code however I like, trying out new design approaches and learning how well they work: all without worrying about functionality in my program.

My tests will tell me if I break something: they always have my back.

> You should be running your tests every ten to fifteen seconds, minimum

That might seem like a lot, but running specs is like a tic for me. Even if I'm sitting thinking about my code, not writing anything, I run them every few seconds. It's reassuring to know my program works, and it frees me up to think about *Design and Design only*. Run your tests _a lot_: eventually you'll feel creeped out if you _don't_ run them. That's a good habit.

Fiddling about a bit, let's worry about design (I've annotated my thinking first, then given the solution later):

<pre>
  <code>
  class Superhero
    # I don't like how this is open to everyone
    # who needs to read this? Can I/How can I
    # ensure only they are allowed to?
    attr_reader :power

    def initialize(name, power)
      # Not using name. Do I need to change my
      # interface? What is the point of name
      # right now?
      @power = power
    end

    def fight(other)
      # Is there any way I can kill this 'if'
      # statement? If statements kinda suck
      # because they introduce hard-to-follow
      # control flow branches
      return self if power > other.power
      other
    end
  end
  </code>
</pre>

Here's my solution to these design problems. First, let's change the interface to get rid of `name`:

<pre>
  <code>
  # Make a couple of superheroes
  # Their power is the only thing
  # relevant to my program now
  batman = Superhero.new(2)
  superman = Superhero.new(5)

  # Make them fight each other
  # No changes needed here
  batman.fight(superman) # => returns superman
  superman.fight(batman) # => returns superman
  </code>
</pre>

Now let's update the class to solve those design problems:

<pre>
  <code>
  class Superhero
    def initialize(power)
      @power = power
    end

    def fight(other)
      [self, other].max_by(&:power)
    end

    protected
    attr_reader :power
  end
  </code>
</pre>

Nice! I was freed up to Google for a [better solution to return a max-powered object from an array](http://stackoverflow.com/questions/8038993/finding-the-element-of-a-ruby-array-with-the-maximum-value-for-a-particular-attr), and better-encapsulated my code. My refactor is complete: now I can write another red test, race to green, and separate my design thinking from my problem-solving.
