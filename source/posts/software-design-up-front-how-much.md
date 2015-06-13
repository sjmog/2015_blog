# Software design up-front: how much?

>A common mistake that people make when trying to design something completely foolproof was to underestimate the ingenuity of complete fools.

> <cite>Douglas Adams</cite>

When starting the process of building software, how much effort should be expended at the beginning? Your answer to this will determine the responsiveness, flexibility, and resource requirements for the duration of the whole project. At Makers Academy we work *Agile*. This means we take an iterative approach to design, just the same way as we take an iterative approach to everything else.

###Not BDUF

>If builders built buildings the way programmers wrote programs, then the first woodpecker that came along would destroy civilisation.

> <cite>Gerald Weinberg</cite>

Given that the design for a piece of software built in an Agile way is going to change frequently, we want to avoid a so-called 'Big Design Up Front' (*BDUF*). 

When designing a car, or a plane, it makes a lot of sense to take a BDUF approach to design. Once the project is approved, it shouldn't change: once you've shipped orders halfway across the world for highly-specified parts, it rarely makes sense to scrap their usage in favour of something better. Each design tradeoff is laboriously debated: will this save time? Money? How much? More money than we spend making a change to our crystalline BDUF design?

Software changes all the time. I have never, at first delivery, delivered a piece of software to which the client hasn't added unanticipated features. I wouldn't want to: often, 'halfway useful' software is just as good as 'useless software'. Software will change throughout the development process, too: maybe your client can't allocate the predicted resources, or the market changes and they need to take the software in a new direction. Spending the first few weeks of a project coming up with a BDUF leaves us inflexible and helpless in the face of this inevitable change. Let's agree it's a bad thing: if you're not convinced, [see what Sandi Metz has to say on the issue](https://books.google.co.uk/books?id=VRCv_bATuSIC&pg=PA9&lpg=PA9&dq=sandi+metz+BUFD&source=bl&ots=5AXHRBhAzP&sig=oBTn1PIk_Mx1wNij7sdEBJXuqQc&hl=en&sa=X&ei=fb4BVYPHJYzlasSCgagP&ved=0CEoQ6AEwCA#v=onepage&q=sandi%20metz%20BUFD&f=false).

###Not NDUF

>I think it's a new feature. Don't tell anyone it was an accident.

> <cite>Larry Wall</cite>

If software chnges so often throughout development, why design at all? Hopefully the answer to this is pretty clear. Software is complex stuff: having *absolutely no design* will guarantee that it ends up an unweidly mass of opinionated programming. 

Just like having a common style guide is vital to orient a team of programmers in the same direction, doing **some** design is necessary to make sure everyone in an Agile team is rowing in the same direction. Having 'No Design Up Front' (*NDUF*) is every bit as foolhardy as a BDUF.

###So...EDUF?

>The software isn't finished until the last user is dead. 

> <cite>Anonymous</cite>

Seeing Design as an *ongoing process* is critical to Agile software development. Software is never 'done', but one day it can be 'done enough'. The trick to running a successful Agile process is doing *just the right amount* of design, and leaving it flexible for future improvements.

'Enough Design Up Front' (*EDUF*) is a philosophy that says the right amount of design is enough for **firm foundations for a software product and its delivery**. For super-complex projects, that might mean a reasonably comprehensive [UML](http://www.uml.org) diagram that depicts a suggested Class structure – even if it changes every week. For simpler projects, it might be enough to simply kick straight into feature/integration tests and let the design [*emerge*](http://en.wikipedia.org/wiki/Emergent_Design#Emergent_design_in_agile_software_development) from the process of development.

And don't forget that EDUF is, if you're working Agile, something that gets reassessed every Scrum. So if jumping straight into constructing feature tests feels weird, recognise that you can design as you go – and next time you scrum, you'll have a neat design that you can use to iterate on.

##TL;DR

- **BDUF** methodology says you should design a system perfectly before jumping into a single line of implementation.
- **NDUF** methodology says you should just get cracking on the implementation straight away, and hang the consequences.
- **EDUF** methodology says you should do just as much design as is necessary to get implementing improvements to a software **product** while giving you more clarity about its **delivery**.
- Great **Agile** teams (like Makers Academy) generally use EDUF methods.