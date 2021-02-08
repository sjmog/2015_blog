# Learning, functionally

Most learning systems treat learners as objects to be modified. What if we treat their learning as data instead?

## Learners-as-objects

The traditional training model treats learners as entities which are modified via the application of some training. You go in as Learner A, and via a sequence of planned interventions, you come out as Learner A containing improved skills. All Learning Management Systems are built on this model: think Moodle or Blackboard or Canvas.

This article explores an alternative approach, which prioritises the learner's learning output ("learnings"), rather than the learner. The sequence acts on these learnings.

There are similarities between the traditional model and an Object-Oriented Programming (OOP) model. It's not "wrong", but it throws up similar issues:

- Learners are hard to test.
- It's hard to track the internal state of learners.
- It requires a lot of overhead to manage.

Object-Oriented Programming (OOP) is often contrasted with Functional Programming (FP). What would a functional training model look like instead?

## Learning-as-data

Functional programming models a program as the flow of data through various functions. We can model learning activities as functions, and their outputs – learnings – can be inputs to other learning activities.

Our "sequence" therefore acts on the learnings, rather than the learner. So, we can dispense with trying to track "learners" (although we might want to reconstruct this picture later).

Here's an example in practice:

- We define a functional activity, `Generate`. In it, learners generate responses to prompts.
- We execute one such activity with the input question `"What were the causes of WW2?"` and a learner.
- The learner generates responses to the question "What were the causes of WW2?".
- These responses are fed into a second functional activity, `Condense`. In it, learners iterate on responses to condense them.
- We might want to supply the outputs into `Condense` again if they're not short enough.
- We feed the condensed responses into a functional activity, `Cluster`. In it, learners cluster similar responses together and name the categories they generate.
- We feed the categories and condensed responses into a functional activity, `Allocate`. In it, learners allocate responses to categories.
- We feed the categories and condensed responses into a functional activity, `Map`. In it, learners link their responses together along with categories and additional rationales (why did you link these two things together?)

We now have three kinds of learner-generated data: responses, categories, and rationales. These are all just text. We can feed them into any of the functions again. For very little content input, learners have generated and interacted in quite a deep way with their understanding. 

If we wanted to up the content input, perhaps, along the sequence, we might flow learners through a `WatchVideo` or `ReadArticle`.

There are a couple of other interesting side-effects of this model:

- Learner-generated content (data) can be tracked as it evolves/as it's iterated on. This would show how learnings have developed over time. For instance: a `Condense` activity needn't mutate the learner responses. Later, we can see how the output from the `Map` activity relates to the output of the earlier `Generate` activity. The differences between data at these different stages might even provide good inputs to other functional activities.
- Any output from learners can be interesting inputs to functional activities. For example, an activity like `VideoQuiz` could ask learners to watch a video, periodically pausing to pose a question with a written answer. These answers could then be paired with the questions and submitted to a `Map`, an `Allocate`, a `Condense`, or some other activity.
- By treating learner output as a first-class citizen, we have interesting options for a) social learning and b) learner tracking. a) With learners' permission, we can allow learners to compare their developing understanding with others at various stages of development. b) a trainer dashboard could simply comprise a feed of learner outputs – supplemented by a kind of analytics or tracking layer – on which they could offer just-in-time feedback at any moment.

## Is this really any different?

I'm definitely not making a claim that these approaches are fundamentally different. But they emphasise different things, and this leads to different benefits. By prioritising the output of learning, we can construct a picture of learners from many different outputs, and see how that evolves over time. But it's a more complex task than simply testing learners at set points, and building a picture of their progress that way.

It's also worth pointing out that this model flies in the face of common belief: that injecting learners with content is the right way to teach them. This model explicitly says: no, it's the learner interacting with their own understanding, modifying and building it explicitly, that builds meaning (and drives the outcomes). In this system, learners spend most of their time interacting with their own (and others') learnings, rather than content designed to transplant new knowledge into the learner. It's a *very* constructivist approach.

There are also tradeoffs between the models when it comes to curriculum planning. For one, the functional model forms a constraint on imagining learning activities: since all activities should produce some output. I'd argue this is a helpful constraint for learning designers, but it does limit us in various ways (e.g. the `WatchVideo` or `ReadArticle` activities I mentioned earlier by way of example are now pretty suspicious).

I have a hunch that curriculum design is an area where a functional approach could seriously add power and speed things up, in a relatively domain-independent way.

## A language for curriculum design?

I'll quickly explain how this functional approach might give curriculum designers (and would-be curriculum designers, aka anyone who wants to help anyone learn anything) a powerful set of tools for rapidly architecting effective courses.

There are two major approaches to curriculum design. The traditional approach is "Storyboard" design:

- Agree the outcomes for a course (normally, "learners can do X, Y, Z". For instance: learners give German economy as one cause of WW2)
- Distribute these outcomes over a set of activities/modules/lessons/weeks. How you distribute depends on your constraints.
- Plan the activities that will lead to these outcomes.

*(Side note – if you ever had someone ask you "how do you do X?" and you recommended they read article X, Y, Z, you did Storyboard design.)*

A more generative form of curriculum design is "System" design:

- Agree the outcomes for a course (e.g. learners give German economy as one cause of WW2)
- Distribute these outcomes over a set of concurrent systems. What systems you build depend on what you're modelling. For instance: through managing a simulated German economy, learners will see the inevitability of its contribution to WW2.
- Plan the events and interactions in and with these systems. For instance: in 1929, simulate the Wall Street Crash.

*(Side note – if you ever had someone ask you "how do you do X?" and you recommended they work in team Y that does X a lot, you did System design.)*

Storyboard design is the most common approach, since it generally produces reliable results and requires much less creative organisational thinking (and expertise) than System design.

This functional model might sit partway between Storyboard and System curriculum design, by acting as a kind of language for defining System-type training. It's nowhere near enough to design a simulation of Germany in the 1930s, but it moves us from sequenced sessions on the topic into a more learner-centered, generative position.

And, having a set of `Generate`, `Condense`, `Allocate` etc tools at your fingertips might make curriculum design less of an overhead in general. You can certainly get a lot of juice out of content.

Anyway, food for thought. I'll be trying to build something like this with [Whatever](https://whatever.xyz) over the next couple of months. Hit me up if it interests you.
