# Lessons from the CSS coalface

CSS can be really hard: it's not naturally object-oriented, and it's built for a bygone era of type-only websites. Here are some tips (from a talk I gave at Makers Academy in London) to help intermediate front-end developers avoid spaghetti-ing their CSS on larger projects.

### Why is CSS easy?

- It's got a simple structure. `selector { attribute: value; }`: easy.
- There are only a handful of selectors.
- There are lots of properties, but the conceptual barrier to using them is low (they're innately visual).

From a traditional development standpoint, CSS is an easy thing to get going with. The syntax is trivially accessible, and there's very little variety in application. But these are all reasons for why CSS also falls on its face so often.

### Why is CSS hard?

- It's got a low conceptual barrier to entry. This makes large-scale CSS _too easy_ to mess up, because it encourages thoughtlessness and verbosity. It doesn't encourage 'best practices'.
- It's informal: the concrete specifications are running way behind browser adoption. CSS lives or dies by trial-by-adoption in browsers, and there's not always rhyme or reason to which properties make it and which don't.
- It's not amenable to Object-Oriented Design, mostly because of issues surrounding globality - where styles leak into other styles - and poorly-planned inheritance (which is integral to the 'cascading' nature of CSS).
- There's no coherent overview of the current state of CSS. Testing is hard, because browsers are many, and there's no real 'right way'. Sites like [CanIUse](http://caniuse.com) exist solely to help developers make some sense of this mess.

CSS' 'easy' points are also its hardest. Because everything is so unstructured - unlike, say, a class-based language such as Ruby, or a prototypal one like JavaScript - **the entire onus of structuring your CSS is on you**. Great CSS programmers find themselves 'inventing' abstractions, which may seem to be adding complexity - but in fact, they're keeping things simpler in the long run.

### Tips for keeping your CSS in shape

1. Let your class structure dictate your CSS structure. Use Class Selectors.
2. Component-ize things.
3. Avoid deep selector chains.
4. Know the box model and z-index context stacking inside out.
5. Work cross-browser.

### 1. Let your class structure dictate your CSS structure

There are a few kinds of structure within a stock HTML page. The first is the **semantic structure**, which indicates the broad-brush division of information on the page. 

To visualise semantic structure, imagine the contents of a page as a kind of sludge. The user's progress through the page is a gradual progression through that sludge. Semantic structure indicates the kind of path a user might want to take to efficiently route through that sludge. So `<main>` is a semantic element that contains the richest, most vital sludge. `<aside>` contains an alternate route through the sludge - less direct, but sludge the user may wish to explore. Semantic elements divide up the information sludge, providing pointers for different routes through it.

In my opinion, you should not be styling these pointers directly. They are broad brushes, dividing up the informational content of a page in a way that is primarily appreciable by browsers. You should instead put classes on semantic elements, and target those classes. Sure, this inflates the size of your HTML, but that's HTML's fault: it's designed for both machines and people, so it doesn't do either particularly well.

This is why I prefer to organise my CSS around a **class structure**. It's distinct from the DOM tree, and deals with specific, more relevant, ways of _presenting_ information: not the information itself. It cascades in a sensible way, so your CSS files are easier to read, understand, and extend. A selector like `.title > .title__number` makes more sense than something like `h1 > span`. As an extra bonus, picking only one kind of selector helps keep weird Specificity issues to a minimum.

### 2. Component-ize things

Large programs hugely benefit from an Object-Oriented approach. Rather than representing a program as a list of commands, object-oriented programs are best visualised as a group of weakly-interacting objects, each encapsulating their own behaviour and state, communicating with one another well-directed messages. Some languages, like Ruby, were built to work that way. CSS was not.

An object-oriented approach can drastically simplify CSS, even from an early stage. Seeing fragments of HTML as components is not new, but encapsulating their styling within a specific class structure is a recent convention. OOCSS, SMACSS, and BEM are all approaches to keeping CSS local to individual HTML fragments. They are specifically designed to avoid scope issues and poorly-planned inheritance problems.

There is a tradeoff between HTML class verbosity and CSS complexity. The less verbose your HTML class structure, the more obscure the CSS targetting that HTML becomes. Here's an example of that using BEM styles:

<pre>
<code>
<!-- non-verbose class structure: simple HTML -->
&lt;header&gt;
  &lt;h1&gt;
    We have &lt;span&gt;14&lt;/span&gt; different lizards in our house
  &lt;/h1&gt;
&lt;/header&gt;
</code>
</pre>

CSS to style the above:

<pre>
<code>
/* non-verbose class structure: complex CSS */
header {
  height: 12vh;
  background-color: #f0f0f0;
}

header h1 {
  font-size: 1.8em;
  color: #777;
}
/* what is this? */
header h1 span {
  color: #ff2424;
}
</code>
</pre>

Here's the same code, using a BEM structure:

<pre>
<code>
<!-- BEM class structure: more verbose HTML -->
&lt;header class="title-block"&gt;
  &lt;h1 class="title title-block__title"&gt;
    We have &lt;span class="numbers title__numbers"&gt;14&lt;/span&gt; different lizards in our house
  &lt;/h1&gt;
&lt;/header&gt;
</code>
</pre>

CSS to style the above:

<pre>
<code>
/* BEM class structure: more legible, extensible CSS */
.title-block {
  height: 12vh;
  background-color: #f0f0f0;
}

.title-block__title {
  font-size: 1.8em;
  color: #777;
}
/* I know exactly what this is */
.title__numbers {
  color: #ff2424;
}
</code>
</pre>

As you can see, the BEM class structure increases HTML verbosity, but drastically decreases CSS complexity. If you're a frontend engineer, you'd rather deal with complex HTML than intractable CSS all day long.

### Avoid deep selector chains

<pre>
<code>
header > h1 > span > i:last-child:after { 
  /* what even am I styling? */
}
</code>
</pre>

Deep selector chains are another enemy of maintainable, extensible CSS. Aside from introducing horrible CSS specificity issues - "Why is this centering? I just told this to text-align left" - they make it extremely hard for future developers to adjust styles rapidly. More often than not, they'll just shove another line of CSS on the bottom of `styles.css` and boom, you're pushing an unnecessary 18 bytes over the wire to every visitor.

Specificity issues are resolvable _once_ by using `!important`. Keep that in the bag for seriously vital global styles. If you find yourself needing to use `!important`, resolve the specificity issue by adding more classes to your HTML. It might seem mad, but the next frustrated developer who can now resolve a global issue with an `!important` will thank you for putting in the time.

### Know the Box Model and z-index

The CSS Box Model is pretty simple to grasp: everything is a box, and everything is typographic. Every layout issue you've ever faced can be solved by a [decent understanding](https://css-tricks.com/the-css-box-model/) of those two facts.

z-index is a different beast: 'context stacking' is the enemy of many a developer. My advice? Use z-index [super-sparingly](http://philipwalton.com/articles/what-no-one-told-you-about-z-index/), and only where you _absolutely cannot_ solve the issue with a deeper understanding of the box model.

Oh, and use `outline` in development. It neatly outlines all the boxes to which you attach the style, without the potential headaches of using `border`.

### Work cross-browser

Don't leave cross-browser testing for the end of development. Use [CanIUse](http://caniuse.com) throughout your frontend development, and play with [BrowserStack's selenium integration](https://www.browserstack.com/automate). Plugins like [PrefixFree](http://leaverou.github.io/prefixfree/) can help to reduce the overhead of constantly remembering browser prefixes. In my opinion, Flexbox is great but still too poorly-supported to be worth implementing. Vertical centering is still an art drawn from the ancient world of tabular HTML: triple-check compatibility when you decide on a solution.

[BrowserSync](http://www.browsersync.io/) will synchronise your in-browser interactions across windows, devices, and locations. I have it permanently switched on, and aliased in my `bash_profile`.

### Wrapping up

Those are they: my best tips for intermediate frontend developers looking to break into a senior role. 

At its heart, CSS is a poor fit for the modern web world. The driving committees behind it are in no position to take on private browser vendors. It's fragmented, unpleasant, and unfit for purpose. Therefore, good CSS requires that you constrain yourself: adding abstraction (which may be perceived as 'complexity') in order to save yourself - and your team - major headaches later on.
