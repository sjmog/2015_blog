# Testing HTML

There's no clear route as to how to provide testing hooks in your HTML. Here are my three suggestions for how to mark up HTML for easy testability, in the absence of a component-based framework.

From an HTML/CSS perspective, this is a _style guide_ decision, rather than a 'best practices' one. This is the same for a lot of HTML/CSS stuff, because they were never built to be tested in this way.

My personal style guide:

1. Add `id` attributes to HTML elements so JavaScript can hook on to them:

<pre>
  <code>
  &lt;div id="myThing"&gt;I'll show first.&lt;/div&gt;

  &lt;script type="text/javascript"&gt;
    var myThing = document.getElementById('myThing');
    myThing.innerHTML = "I'll show now";
  &lt;/script&gt;
  </code>
</pre>

By this logic, it's **totally OK to use `id` attributes for JavaScript-led testing.** Capybara doesn't use JavaScript to tell if elements are on a page, though, so `id` doesn't seem the right attribute to use.

2. Add `class` attributes to HTML elements to tell what they are:

<pre>
  <code>
  &lt;div class="the_thing"&gt;I'll show first.&lt;/div&gt;

  &lt;script type="text/javascript"&gt;
    // getElementsByClassName returns an array containing the .the_thing element
    var myThing = document.getElementsByClassName("the_thing")[0];
    myThing.innerHTML = "I'll show now";
  &lt;/script&gt;
  </code>
</pre>

By this logic, **`class` is the right attribute to use for non-JavaScript testing.**

However, this approach to using classes relies on two assumptions:

- We are using [Object-Oriented CSS](http://oocss.org/);
- We are using class names to name HTML/CSS 'objects'.

There is a third route, which seems messy but is potentially better: 

3. Use a `data-testinghook` attribute like this:

<pre>
<code>
  &lt;div data-testinghook="myThing"&gt;I'll show first.&lt;/div&gt;

  &lt;script type="text/javascript"&gt;
    // querySelectorAll returns an array containing the element
    var myThing = document.querySelectorAll('[data-testinghook="myThing"]')[0];
    myThing.innerHTML = "I'll show now";
  &lt;/script&gt;
  </code>
</pre>

That last one seems fairly messy, though, and it'll make your HTML look awful (which is actually not as bad as it sounds).

My 2 cents - use suggestion number 2.