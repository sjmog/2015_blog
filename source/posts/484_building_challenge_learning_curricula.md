# Building Challenge-based learning curricula

How to write exciting, problem-first curricula with sequencing, scaffolding, and self-direction. Normal curricula teach learners a formula, then to apply it. Challenge-based curricula put the problem first, and use constructivist learning techniques to build power and context in learners.

### What is a challenge?
A challenge is a self-contained problem. They allow learners to practice a skill, or work out a concept, in "contextualised isolation". Challenges are both modular, allowing for isolated practice, and part of a sequence, which provides context.

A challenge is a step towards two goals: a project goal, and a learning goal. Together, the set of challenges and goal may be termed a “unit”. At Makers, challenge-based units are one week long. In a week, there are usually 15 to 25 challenges.

Challenges should take somewhere between 15 minutes and half a day – the equivalent of a 1 to 2-point ticket, if you were playing Agile [planning poker](https://en.wikipedia.org/wiki/Planning_poker).

Generally, the sequence of challenges is generated in one of two ways:

- A skilled practitioner works towards a project goal, noting the problems, steps, and key learning opportunities they face along the way, and converts these ‘pivot points’ to challenges.
- Converting a pre-existing tutorial (which usually details the above using prose).

> Picking which ‘pivot points’ to convert to challenges can be tough, as many such points can lie off the critical learning path – they can be distractions from the main subject-under-study, and might confuse the learner.  

## Anatomy of a Challenge Sequence
Although challenges should be modular, they’re most powerful as part of a sequence, where challenges are ordered one-after-the-other.

![An example Challenge Sequence: a list of links to challenges in a Github README](https://i.ibb.co/9rp9KXb/challenge-sequence.png)

Challenge sequences progress towards a “project goal”, or a portfolio-ready piece of working software. They also progress towards a “learning goal”, or specific area of focus.

> At current, there’s unresolved tension between these kinds of progress, and the formulation of the “learning goals” in very concept-heavy terms.  

Each individual challenge draws its context from some of the challenges preceding it; so it’s important that learners can access the challenge sequence at any time.

> The Challenge Sequence is sometimes called the “Challenge Map”, especially if there are multiple branching paths to take.  

Over the course of a sequence of challenges, learners construct understanding of how techniques, technologies and tools are used to solve problems, and practice their problem solving.

#### Building and abstracting context throughout the sequence
Learning doesn’t happen in isolation – new knowledge and skills can be seen as adding nodes to, or refactoring, an existing learning graph. This process is more efficient if the learner is clear “where” the learning is taking place, among all the other concepts they have floating around in their head.

As learners progress through the sequence, prior low-level learnings are encapsulated and abstracted, and the complexity of tasks increases. This results in learners who are able not just to understand a concept or skill, but apply it to other contexts. 

For example, early challenges in a week focussed on a web application project might be quite low-level, with outcomes like “write a single `GET` route”, “make a simple HTTP `POST` request”, and “write a simple HTML form”. As the sequence progresses, these three concepts might be abstracted together, with intermediate outcomes being “write the controller routes to save this form submission to a database”. The very final outcomes would further abstract these concepts, being “allow a user to delete their blog posts”.

This “inside-out” approach to developing conceptual understanding, bounded by context, is a powerful way to develop grounded higher-level skills rapidly. It also makes it easier for learners to apply learned skills and concepts in unfamiliar contexts. This is because they have a detailed nested “map” of context, which makes analogising easier.

Another way of thinking of this is: once you’ve built a Rails route, a Rails model, and a Rails migration, then understood them together, abstractly, as “building a full-stack feature”, it’s easier to work out what’s meant by “build this new feature in Django”.

## Anatomy of a Challenge
![A diagram of a challenge, labelled with the parts listed below](https://i.ibb.co/n0TC222/challenge-structure.jpg)

A challenge has five parts:

- Title and introduction, to set the challenge context and goal.
- Learning objectives, to set the learning context.
- Scaffold, to support learners by breaking the challenge goal into subgoals.
- Resources, to support and enrich broader learning from this challenge. 
- Walkthrough, to provide tips and tricks for solving these kinds of problems.

### Title and introduction
Challenge introductions have four parts:

1. A Title.
2. An Orientation Summary.
3. Success Criteria.
4. New/important terminology.

Guidance for each follows.

#### Making challenges memorable with good Titles
Good titles are short, snappy, and clearly descriptive. They also act as hooks for the challenge – the more interesting the title, the more memorable the challenge will be.

It’s important titles are clear, as challenges are designed to be re-attempted by learners who self-evaluate as needing more support. They need to be able to remember and be hooked to come back to them.

#### Setting context with good Orientation Summaries
Challenge introductions start by orienting the learner, setting the project and learning contexts for this challenge.

> This is important because learning doesn’t happen in isolation – new knowledge and skills can be seen as adding nodes to, or refactoring, an existing learning graph. This process is more efficient if the learner is clear “where” the learning is taking place, conceptually.  

A good orientation summary will sum up in one line, “where” the learning is taking place, by referencing previous progress. 

There are two kinds of orientation summary:

- **Same level of abstraction.** The summary simply states what the previous couple of challenges did, without introducing new terminology.
- **Higher level of abstraction.** The summary uses new terminology to summarise several challenges’ worth of progress.

If the challenge you are writing shares the context of a previous challenge, use a “same level of abstraction” summary. For instance: in a previous challenge, a learner built a `POST` route in their controller. In this challenge, they’ll build a `GET` route in their controller. A good summary would be “we defined a single route, `POST`, in our controller”. This summary *reinforces and reminds* the previous material’s context, and keeps the learner in the same conceptual space.

If the challenge you are writing sits in a wider contextual space, use a “higher level of abstraction” summary. For instance, if a learner has just spent ten challenges building a backend API, a good learning orientation might be “we’ve just built a backend API in Rails”. This summary *abstracts and encapsulates* the previous material’s context, making it easier to work with in different contexts in future.

(See the section “Anatomy of a Challenge Sequence” for more about the role of contextual abstraction in designing challenges).

#### Establishing a clear goal with good Success Criteria
Success Criteria detail what the project goal of this challenge is.

Challenges are complete once the success criteria are met. Success criteria are of the form:

“In this challenge, we will…*thing to achieve*.”

Success criteria are another opportunity to encapsulate and abstract prior learning. For instance, if the learner has just completed the following three challenges: 

1. Write a unit test.
2. Implement code to solve the failing test.
3. Refactor the implemented code to a coding standard.

A good success criteria for a fourth challenge that encapsulates and abstracts prior learning might read:

“In this challenge, we will complete a full TDD cycle for a new feature.”

#### Increasing learner power with new terminology
New terminology should be highlighted (by **bolding** it) in one of two cases:

1. It’s a new term that the user will need to know to tackle the problem (and they couldn’t reasonably have guessed it or discovered it).
2. It’s a new term which abstracts previous concepts.

Knowing terminology can provide a sense of power to the user. At the least, it can provide them with a direction if they’re stuck: not knowing the meaning of a word is a powerful prompt to go and research it.

Even better, new terminology can provide an efficient way to play around with new abstractions of previous concepts.

Challenges should introduce at most *three*, and at least *one*, new pieces of terminology. It should be left to the learner to go discover what they mean.

This limit on new terminology means you have to be judicious when introducing new terms, and pick only the most powerful abstractions.

### Learning Objectives
Learning objectives are statements of what a learner should be able to do after completing this challenge.

Challenges contain learning objectives so learners can come back to them when they want to practice a particular skill they feel weaker at.

Learning objectives should be of the form:

“*Verb* a *thing* [*context*]”

For instance:

- *Write* a *feature test* *using Capybara*.
- *Refactor* the *model layer*.
- *Pass* a *failing test*.

Whatever you do, **avoid the word “understand” when writing learning objectives**. “Understand” is super-nebulous. All good learning objectives should have action-oriented, application-focussed verbs.

> If the objective of your challenge is to “understand” or “explain” something, it probably shouldn’t be a challenge. Use another format (a workshop, practical, reading, or exercise) to do it.  

### Scaffold
While challenges should be completable based on the success criteria alone, most first-timers will benefit from a scaffold to help them make progress.

Scaffolds are made up of sequential scaffold steps, which provide guidance for achieving the success criteria.

Scaffold steps should, like challenges, produce an outcome: they are not supposed to be used for controlling learner behaviour. So, scaffold steps like “discuss this with a colleague” are not very helpful.

Think of them like mini success criteria for the subgoals of completing this challenge.

You may also want to include a specific scaffold step if there are common issues with completing a challenge, such as setting up a Postgres database on Linux.

It’s easy to over-rely on scaffold steps when writing a challenge, and accidentally turn the challenge into a bad tutorial. Scaffold steps should aim to unblock common pitfalls and prod people in the right direction. A good rule-of-thumb to avoid doing this is: **all challenges should be completable without a scaffold**.

It’s a good idea to make scaffolds oblique, or slightly cryptic. That way, there’s effort involved in working out exactly how to complete the given subgoal.

### Resources
Each challenge should link to best-in-class resources which help learners master topics required for or associated with this challenge.

Resources should be:

- Accessible, especially for those with screen readers.
- Varied media (not just blog posts).
- Clearly related to or useful for completing the challenge.
- Either expansive (i.e. providing additional richness to the context of the challenge) or supportive (i.e. providing helpful guidance to the context of, or concepts involved in, the challenge).

There should be a minimum of one, and a maximum of five resources attached to a challenge.

### Walkthroughs
Generally-speaking, challenges come with walkthroughs, which model the processes and concepts required to complete the challenge.

Walkthroughs can be written documents, videos, recorded pairing sessions, or other media.