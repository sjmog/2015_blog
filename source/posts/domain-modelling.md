# A brief introduction to Domain Modelling

*The content of this article is drawn from A brief introduction to Domain Modeling (McLeod 2009). Content has been simplified and streamlined. You can read the original [here](http://www.slideshare.net/grahammcleod/brief-introduction-to-domain-modeling)*

###What is a domain model?
>an *abstraction* (a *model*) of an *area of interest* (*domain*).

Domain models give a high-level overview of the entities that make up a particular area of interest, and the links between them.

###What is a domain model not?
>A domain model is **not** a full-featured logical description of a database schema or a program structure. 

It is chiefly a way to get a broad-brush overview of an area of interest, and may be used to start developing more complex models (such as database schema).

###Can you show me a domain model?

Sure. Here's a simple domain model of a small business' employee structure:

![Three boxes stacked vertically. The bottom box contains the word 'Manager', the middle 'Employee' and the top box 'Person'. There are arrows pointing upwards between each box.](https://dl.dropboxusercontent.com/s/ng3wgcnr9xvcbcw/Screenshot%202015-03-11%2014.38.05.png?dl=0)

###How can I build a domain model?
Building a domain model gets harder as the domain gets more complex. Since you decide what does and does not belong in a domain, your model will change over time. In an [Agile](http://agilemanifesto.org/principles.html) process it is usual for the domain model to be rebuilt many times.

To build simple domain model:

- Entities (sometimes called 'unique concepts' or 'business objects') are represented by **rectangles**.
- An arrow between entities indicates that one entity is a **subtype** of another. For example, in the diagram above, all *Employees* are also *People*, and all *Managers* are also *Employees* (and so also *People*). So *Person* is a **subtype** of both *Employee* and *Manager*.
- A simple line between entities indicates that they are related in some other way.

There are many more ways of indicating more complex relationships between entities. These become necessary as domain models become more complex. Most of these rules are part of an accepted design language, [UML](http://en.wikipedia.org/wiki/Unified_Modeling_Language) (*Unified Modelling Language*). You do **not** need to be proficient in all aspects of UML to build clear domain models.

###When might I use domain models?

Domain modelling is one of the first steps in designing software. In an Agile process, an accurate domain model guides how to translate [user stories](http://www.agilemodeling.com/artifacts/userStory.htm) into an implementable [class structure](http://blog.sjmog.co). More generally, domain models are also used in [systems theory](http://pespmc1.vub.ac.be/systheor.html) to model complexity.

###Wrapping up

- A domain model is an abstraction of an area of interest.
- They consist of *entities* (in rectangles) and the *relationships between them* (as lines and arrows, and more generally in Unified Markup Language).
- Domain models are one step in translating from *user stories* to *class structures*.

