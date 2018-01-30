# What’s the ‘simplest thing?’

The conventional wisdom when doing programming is to start with the ‘simplest thing’. But what is the ‘simplest thing’? How do you know something is ‘simple’? And are there different ‘simple things’ that work better with different approaches?

I see four main candidates for the ‘simplest thing’: 

- interactions, 
- rules,
- components, and
- chunks. 

_The simplest interaction_ involves building one small interaction with one object: one whose interface you have designed. _The simplest rule_ involves identifying some constraint on the system and building that. _The simplest component_ involves building the smallest, most atomic part of the system. _The simplest chunk_ involves identifying one large-ish object in the program, building it, and breaking it down into smaller objects.

Using the [Bank Tech Test](https://github.com/lauraweston/bank-tech-test), here are four different first steps you could take.


### The simplest interaction.

The _simplest interaction_ is my favourite first building block: a [behavioural one](http://ruby-for-beginners.rubymonstas.org/writing_classes/state_and_behaviour.html). An interaction is an atomic transaction with a program object. For instance: ‘an Account can store money’. 

- First, build the interaction as simply as possible. 
- Then, look at the next interaction in the system, for example ‘an Account can withdraw money’.

One benefit to this approach is that it allows us to think about a high-level interface first. We can start by writing a test for the code we wish worked:

<pre>
  <code>
  # An account can store money
  my_barclays_account = Account.new
  my_barclays_account.store(10) # => 10
  my_barclays_account.store(10) # => 20
  </code>
</pre>

Then we can make it work.

<pre>
  <code>
  class Account
    def initialize
      @balance = 0
    end

    def store(amount)
      @balance += amount
    end
  end
  </code>
</pre>

Because we're starting with an interface, starting from the simplest interaction is amenable to [outside-in TDD](https://dannorth.net/introducing-bdd/). This means we can use an integration test to build out the Account interface:

<pre>
  <code>
  RSpec.describe 'Interacting with an Account' do
    describe '#store' do
      it 'stores money' do
        my_barclays_account = Account.new

        my_barclays_account.store(10)

        expect(my_barclays_account.store(10)).to eq 20
      end
    end
  end
  </code>
</pre>

(At the moment, we've only got one class: the Account. But later, Account might rely on other things. This integration test will grow to test the Account interface without mocking anything else.)

Repeated application of _the simplest interaction_ will start to produce _the simplest chunk_ (see the last section). When this starts to happen – that is, when you notice your class contains too many responsibilities – do the following:

- _Extract method_, then (possibly) 
- _Extract class_. 

That way repeatedly applying _the simplest interaction_ builds towards a complete program manageably.

### The simplest rule.

The _simplest rule_ is another behavioural building block. A rule is something that is necessarily true about a system. For example: ‘an Account cannot be negative’. Another example: ‘an Account cannot store a negative amount’. 

- Build the rule as simply as possible.
- Then look at another one.

> A rule is sometimes quite complicated to implement, and fulfilling it may involve many objects. Therefore, it's best to build the rule similarly to building a chunk (see the next section): as a bloated glob with multiple responsibilities. Then, use refactoring techniques to break it down.

Starting with the simplest rule involves both thinking about the interface at a high level _and_ the objects involved, therefore it's amenable to both inside-out and outside-in TDD.

<pre>
  <code>
  # An account cannot be negative
  my_barclays_account = Account.new
  my_barclays_account.withdraw(10) # => Error: account cannot be negative
  </code>
</pre>

We can build the rule quite simply, to start:

<pre>
  <code>
  class Account
    def initialize
      @balance = 0
    end

    def withdraw(amount)
      raise 'Error: account cannot be negative'
    end
  end
  </code>
</pre>

We can then look at another rule:

<pre>
  <code>
  class Account
    def initialize
      @balance = 0
    end

    def store(amount)
      raise 'Error: cannot store a negative amount'
    end

    def withdraw(amount)
      raise 'Error: account cannot be negative'
    end
  end
  </code>
</pre>

In both of these examples, we've ended up programming away from the [happy path](https://en.wikipedia.org/wiki/Happy_path), but we could have selected rules that kept us to it (for example, 'the balance is the sum of all transactions').

### The simplest component.

The _simplest component_ is a more advanced technique. In it, you start by fully-defining the most atomic building block of a system. For example: a quantity, a currency, or a transaction. 

- First, build it. 
- Then, extend it so it can work with other instances of itself. 
- Then, build the rest of the system using it: build up interaction from there. 

Building the simplest component is amenable to [inside-out TDD](https://8thlight.com/blog/georgina-mcfadyen/2016/06/27/inside-out-tdd-vs-outside-in.html). It works well with a [Chicago approach to TDD](http://codemanship.co.uk/parlezuml/blog/?postid=970).

> A powerful example of this approach is using the [quantity pattern](https://github.com/bhuga/quantity/blob/master/lib/quantity/unit.rb).

<pre>
  <code>
  # Understands the presentation of a transaction
  class Transaction
    include Comparable

    def initialize(amount)
      @amount = amount
    end

    def +(other)
      @amount + other.amount
    end

    def -(other)
      raise 'Cannot have negative money' if other > self
      @amount - other.amount
    end

    def <=>(other)
      @amount <=> other.amount
    end

    def credit?
      @amount.positive?
    end

    def debit?
      @amount.negative?
    end

    protected

    attr_reader :amount
  end
  </code>
</pre>

Now that we have a thorough `Transaction` object, we can easily work with a variety of different kinds of transaction.

<pre>
  <code>
  cinema_tickets = Transaction.new(14)
  diet_coke      = Transaction.new(1.65)

  balance = cinema_tickets + diet_coke # => 15.65
  cinema_tickets > diet_coke # => true
  diet_coke - cinema_tickets # => 'Cannot have negative money'
  </code>
</pre>

From here, we can build outwards: perhaps we'd look for something to house the transactions, or something to do calculations with them.

I generally recommend **against** _the simplest component_ unless you have a very solid understanding of the problem domain. It therefore works very well when used with [programmer anarchy](https://www.infoq.com/news/2012/02/programmer-anarchy), a post-Agile philosophy developed by [Fred George](https://github.com/fredgeorge).

### The simplest chunk.

The _simplest chunk_ combines state and behaviour in a building block. For example: ‘an Account’. It's my least preferred first step, because it's too easy to accidentally build a whole program, then wind up with a painful and tedious refactor (which we'll do now). I really only advise starting with the _simplest chunk_ when [spiking](http://www.extremeprogramming.org/rules/spike.html) part of a system.

- Build the chunk in as much detail makes sense.
- Then extract functionality using refactoring techniques – mostly [_extract method_](https://refactoring.guru/extract-method) followed by [_extract class_](https://refactoring.guru/extract-class) – to build out collaborator objects. 

Starting with the simplest chunk involves 

- thinking about multiple parts of the interface at a high level, 
- building an object that meets that interface,
- extracting collaborator objects from excess responsibilities in the object you built. 

Therefore, it's amenable to both inside-out and outside-in TDD (so long as the chunk is small). It works especially well with a [mockist](https://martinfowler.com/articles/mocksArentStubs.html) approach to TDD. I'm going to take deliberately large steps, so I won't be using TDD as I go. I rarely use TDD if I'm spiking: as it's exploratory code I'm going to throw away.

Let's start by spiking the sort of object that an Account could be. It should: 

- add and withdraw money, 
- give us a statement, and 
- raise some errors when the user tries to do the sorts of things an Account shouldn't do. 

As we go, we can make interesting decisions, and refer to the spec for each one. For example: should we accept a starting balance? After withdrawing do we return the balance, the date-stamped withdrawal transaction, or just the withdrawn amount? Answering these questions with the spike with help us to move more swiftly later on.

We'd like to be able to use the Account like this:

<pre>
  <code>
  require 'account'

  account = Account.new
  account.store(10)
  account.store(20)
  account.withdraw(14)

  # should give an error
  account.store(-10) 

  # should give an error
  account.withdraw(100)

  # should print a statement 
  # (without the erroneous transactions)
  account.statement
  </code>
</pre>

Sticking this code in a script gives us a kind of integration test we can run to catch errors as we build out the Account functionality. We'll keep the Account interface the same as we go: so this 'test' shouldn't need to change.

We can use the _simplest chunk_ approach to understand the ultimate structure of the system. For instance, it's apparent early on that we need Accounts to store date-stamped transactions: not just a simple `@balance` integer.

<pre>
  <code>
  class Account
    # The spec doesn't talk about starting balances,
    # so no starting transactions when creating an account
    def initialize
      @transactions = []
    end

    def store(amount)
      raise 'No storing negative money!' if amount < 0
      @transactions.push([amount, Time.now])

      # storing should probably give us the stored amount?
      amount
    end

    def withdraw(amount)
      raise 'Not enough money!' if amount > @transactions.map { |transaction| transaction[0] }.reduce(:+)
      @transactions.push([-amount, Time.now])

      # withdrawing should probably give us the withdrawn amount?
      amount
    end

    def statement
      print "date || credit || debit || balance\n"
      @transactions.inject(0) do |running_balance, transaction|
        running_balance += transaction[0]
        print "#{ transaction[1] }  || #{ transaction[0] if transaction[0].positive? } || #{ transaction[0] if transaction[0].negative? } || #{ running_balance }\n"
        running_balance
      end
    end
  end
  </code>
</pre>

Now that we meet the integration spec, we can use _extract method_ on this spike to start investigating what responsibilities are hiding inside `Account`:

<pre>
  <code>
  class Account
    def initialize
      @transactions = []
    end

    def store(amount)
      raise 'No storing negative money!' if amount < 0
      @transactions.push(transaction(amount))
      amount
    end

    def withdraw(amount)
      raise 'Not enough money!' if amount > running_balance
      @transactions.push(transaction(-amount))
      amount
    end

    def statement
      print_header
      print_transactions
    end

    private

    def transaction(amount)
      [amount, Time.now]
    end

    def running_balance(transactions = @transactions)
      transactions.map { |transaction| transaction[0] }.reduce(:+)
    end

    def print_header
      print "date || credit || debit || balance\n"
    end

    def print_transactions
      @transactions.each { |transaction| print_transaction(transaction) }
    end

    def print_transaction(transaction)
      print "#{ transaction[1] }  || #{ transaction[0] if transaction[0].positive? } || #{ transaction[0] if transaction[0].negative? } || #{ running_balance(transactions_up_to(transaction)) }\n"
    end

    def transactions_up_to(transaction)
      @transactions.slice_after(transaction).to_a[0]
    end
  end
  </code>
</pre>

Using _extract method_ exposed four extra sets of responsibilities, which now lurk in the private methods of `Account`:

- making Transactions, which bundle together amounts and times
- printing Transactions in some kind of statement
- managing and querying Transactions
- calculating the balance of a set of Transactions

That last responsibility could belong to the same object that manages and queries Transactions: we don't know yet. We should use _extract class_ on each responsibility, checking as we go. We can come up with some names for objects that could be responsible for each of the above:

- _a Transaction object_ understands making Transactions, which bundle together amounts and times
- _a Statement object_ understands printing Transactions in some kind of statement
- _a Transactions object_ understands managing and querying Transactions
- _a Balance object_ (or maybe _a Transactions object_) understands calculating the balance of a set of Transactions

Let's use _extract class_ a few times:

<pre>
  <code>
  # Understands the presentation of a single transaction
  class Transaction
    attr_reader :amount

    def initialize(amount)
      @amount = amount
      @time   = Time.now
    end

    def debit?
      @amount < 0
    end

    def credit?
      @amount >= 0
    end

    def time
      @time.strftime("%d/%m/%Y")
    end
  end

  # Understands the calculation of the sum of transaction amounts
  class Balance
    def self.of(transactions)
      transactions.map(&:amount).reduce(:+)
    end
  end

  # Understands the management and querying of transactions
  class Transactions
    include Enumerable

    def initialize
      @state = []
    end

    def each(&block)
      @state.each(&block)
    end

    def store(amount)
      @state.push(Transaction.new(amount))
      amount
    end

    def withdraw(amount)
      @state.push(Transaction.new(-amount))
      amount
    end

    def up_to(transaction)
      @state.slice_after(transaction).to_a[0]
    end
  end

  # Understands the presentation of statements
  class Statement
    HEADER = "date || credit || debit || balance\n".freeze

    def initialize(transactions)
      @transactions = transactions
    end

    def self.with(transactions)
      new(transactions).to_s
    end

    def to_s
      print HEADER
      print transactions
    end

    private

    def transactions
      @transactions.inject("") do |output, transaction| 
        output << " #{ transaction.time }  ||" 
        output << " #{ transaction.amount if transaction.credit? } ||"
        output << " #{ transaction.amount if transaction.debit? } ||" 
        output << " #{ Balance.of(@transactions.up_to(transaction)) }\n"
      end
    end
  end

  # Understands the filtering of appropriate activity
  class Account
    def initialize
      @transactions = Transactions.new
    end

    def store(amount)
      raise 'No storing negative money!' if amount < 0
      @transactions.store(amount)
    end

    def withdraw(amount)
      raise 'Not enough money!' if amount > Balance.of(@transactions)
      @transactions.withdraw(amount)
    end

    def statement
      Statement.with(@transactions)
    end
  end
  </code>
</pre>

I advise **against** picking _the simplest chunk_: it's too easy to get caught up in doing too much. People often accidentally build _the simplest chunk_ when what they wanted to build was the _simplest interaction_. A good way to avoid that is to use a rigid 15-minute timebox. If you run over and you're not done (implementation and refactoring), start again with a smaller, simpler interaction.

On the other hand, doing this spike has opened me to the possibility of the existence of services, a statement object, the Account-as-a-filter, and so on. These are all valuable insights for design decisions I might take as a I move in a more step-by-step manner.

### Summary

There are four different ways to define the 'simplest thing':

- interactions, 
- rules,
- components, and
- chunks.

_The simplest interaction_ involves building one small interaction with one object: one whose interface you have designed. _The simplest rule_ involves identifying some constraint on the system and building that. _The simplest component_ involves building the smallest, most atomic part of the system. _The simplest chunk_ involves identifying one large-ish object in the program, building it, and breaking it down into smaller objects.

Mostly, my 'simplest step' starts with _the simplest interaction_. After a while, lots of simple interactions lead to an object that looks a bit like _the simplest chunk_: but at that point it's manageable to _extract method_ and then _extract class_.

One thing to avoid is prematurely building out new _simplest chunks_ halfway through building something else. Avoid introducing new objects until _extract method_ and _extract class_ tell you to, or until some deliberate new design step has begun. A good way to hold yourself to this is to use 15-minute design cycles.
