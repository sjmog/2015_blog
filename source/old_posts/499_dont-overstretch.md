# Don't overstretch

I'm learning the hard way how to avoid overstretching. When you take sole ownership of a project, it's very easy to run ahead and implement a bunch of great stuff - but it's rarely a good idea.

### Hook the team in first

Always, **always** make sure your team are on board before you start anything. You might think that you can simply drum up some beautiful documentation, comment neatly, and give a whizz-bang presentation, but the chances are your new process won't have the same impact as an external one.

For example, I recently put a lot of work into the [Makers Styles](https://github.com/makersacademy/components) gem. The idea was to abstract all HTML and CSS into a neat DSL that would allow marketing-types to build whole pages, using selected designed templates, using only YAML files.

By the time I'd developed the idea to a mature point, written docs, and presented it to the team, I was too late. I was too abstract: I'd decided to include [BEM](https://en.bem.info/) styles (in a very similar style to [this way of building pages](https://en.bem.info/tutorials/quick-start-static/)), which the team were struggling to get their head around. I was introducing `parent` and `modifier` arrays to construct CSS classes. For me, it was brilliant: I could skin up whole new pages using brand new data, all from YAML, in a matter of minutes.

For my team, it was intractable. They tried at it for a week and a half - well beyond what other teams would put in - and eventually resolved to build the site from scratch using [Bourbon](http://bourbon.io/), [Neat](http://neat.bourbon.io/), and [Bitters](http://bitters.bourbon.io/). That's my failing - I needed to loop them in way, way earlier in the process.

### How do I hook people in?

During this process, I'd asked for advice and assessed interest continually. In our latest retrospective, the team acknowledged this, but mentioned how tough it was to dissent amidst a bunch of assentors. We all resolved to get better at this, but a couple of us think we have a solution: build, build, build. Discussion is good, but the only way to resolve a philosophical disagreement in development is to drop your ego at the door and make something. Because it was two or three weeks of general assent before the team actually began building using my styles, their buy-in rapidly dwindled.

So, even if you have to force them, get some pairing in with members of your team so you can properly encourage their criticism. Otherwise, it takes serious hutzpah to challenge a project someone really cares about.

That's pretty much it. Don't overstretch if you're given sole ownership of a project, and make sure you're forcing people to give their opinion by _building stuff with them_ as you go along. Happy Monday!
