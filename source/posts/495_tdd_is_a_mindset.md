# TDD is a mindset

Something I'm very keen on telling students is that Test-Driven Development is not just about initializing RSpec and making sure you've got great coverage. TDD is a mindset that should guide how you articulate and communicate problem spaces, without jumping to solutions too fast.

### The Problem Space

At [Makers Academy](http://www.makersacademy.com), students start out with simple(ish) problems. In the first week, they build a simplified version of a well-known London transport system. In the next, they work with a two-player board game. Aside from keeping the moving parts down, the simplicity of these projects helps to keep the _problem space_ nice and narrow.

I'm going to assume that you're comfortable with the term _Domain_ and its programming associate, the _Domain Model_. In my opinion, a Domain Model is separate to the problem space surrounding that model - although clarifying one inevitably results in more clarity in the other.

A domain model is a static entity (at least for the duration of a sprint). By that, I don't mean that it can be mapped in its entirety before work begins – rather, I mean that it exists, somehow, and _emerges_ from the process of development. A domain model is fixed but obscured: agile development practices gradually pull back that shroud until a clearer view is reached.

A problem space is not fixed. It's a fluid construct that exists only while discussed, and refers to the immediate concerns surrounding the domain model. You could consider it to _be_ the shroud which is pulled away - only clear in retrospect, and likely very different depending on the solution practices used by the development team. It is ephemeral, where the domain model is enduring. Problem spaces are immortalised only in a git commit history, domain models are immortalised in code.

Why is this important? Because development teams tend to focus on clarifying the domain as a matter of priority. I propose that recalibrating to focus on the immediate problem space encourages developers to allow the domain model to emerge, without having to force code along preconceived lines. Also, the problem space is a shallow one - it's a space that can be discussed rapidly and purposefully by engaged stakeholders. Finally, thinking in terms of the immediate problem space, rather than the domain as a whole, forces developers into a more methodical mindset - one that is perfectly complemented by best-practices in communication, pair experimentation, and TDD.

Does the concept of a problem space add anything? If the domain model is the result, and the problem space is the route taken, could the 'problem space' not simply consist of a series of tickets? Well, yes - but we have lacked an appropriate concept for this (beyond 'Sprint Focus'). Nailing down what a problem space _is_ allows developers to communicate sensibly around a single entity in a methodical manner. Rather than racing through the testing phase to implement code that represents a hastily-assembled domain model, seeing the problem space as primary encourages developers to see the testing phase as the primary communicative means for solving a problem.

### So...TDD?

OK, so back to TDD. Where does it fit in all this? Even the most evangelistic Test-Driven Developer, when pressed to explain their methods, will fall back on 'well-tested code delivers a stable end product'. And this is true: but it's very hard to inculcate in juniors. Juniors don't have the horrific experience of refactoring a poorly-tested system: their tanks of midnight oil remain full, untouched by panicked war-room sessions. What they can be taught, though, is that testing is a mindset: a communication mechanism for discussing a problem before committing to a course of action that defines a domain model.

For more experienced developers, this could be seen as a call-to-arms for TDD. Even the best-constructed domain model is a fragile structure, prone to changes in management, leadership, market forces, development constraints, and so on. Attacking the problem space too fast - failing to discuss the exact nature of the problem through tests - pulls the sheet from off this structure with a speed that risks collapsing the entire thing.

So, TDD is a mindset. It's not something that exists just at the 'testing phase' - it's a communication tool for kicking off a project, for kicking off a sprint. It's a tool for discussion when readying the implementation of a feature. It's a tool for embedded QA to ensure that every team member is on the same page during a project. Critically, it's a tool for non-developers to understand the kind of structure that is emerging from the requirements they set out, and deciding whether their requirements are being defined appropriately - all well in advance of final delivery.
