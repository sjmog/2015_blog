# Fitbit is failing on its mission

Fitbit's mission is to "To empower and inspire you to live a healthier, more active life: designing products and experiences that fit seamlessly into your life so you can achieve your health and fitness goals, whatever they may be." By ignoring multiple requests from the trans community to improve product inclusivity, they are failing their customers and failing on their mission.

### The state of play

I was pretty thrilled to open my new Fitbit. I'd been watching my younger brothers running all over the Alps with theirs all Christmas, avidly comparing activity rates and challenging each other. I wanted in: Fitbit is a non-intrusive, exciting way to keep tabs on your activity. I'm a cisgender (i.e. non-trans) guy, assigned male-at-birth, so the post-registration screen posed no problems for me:

![Choose your gender: male or female](https://s-media-cache-ak0.pinimg.com/736x/15/19/b9/1519b91eeaaae4c15a6bcee83a49da36.jpg)

Easy!

However, that's not the case for everyone. In fact, that's not the case for a large number of people. [Here](https://community.fitbit.com/t5/Feature-Suggestions/Intersex-option/idi-p/1179727) is a Fitbit community thread illustrating part of the problem (behind registration wall). Even once we get past the weird problem that Fitbit think 'Male' and 'Female' are genders, rather than sexes, there's a bigger problem lurking: these options force people who are neither men nor women into one of these two categories.

What's crazy to me, as an engineer working with cool tech in an Agile world, is that this problem has been hanging around since _January 2014_: over _three years_ now. Three years is a lifetime in tech. It's an eternity for a major necessary feature request to be hanging out in some forgotten forum.

OK, so maybe this is just a feature that didn't get requested much, and is sitting at the bottom of some backlog or kanban or Trello or something. No biggie. Unfortunately, not so.

My partner, who is trans and neither a woman nor a man, signed up for Fitbit today. They were frustrated at the limited gender options. When they expressed their frustration, they were given the following reply (three times!), sending them to the 3-year-old thread buried deep in Fitbit's forums:

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr"><a href="https://twitter.com/cnlester">@cnlester</a> We appreciate your feedback. As of the moment, our feature suggestions page is the best way to reach our developers. Thank you.</p>&mdash; Fitbit Support (@FitbitSupport) <a href="https://twitter.com/FitbitSupport/status/817982306182840323">January 8, 2017</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

OK, but there's nothing in Fitbit's personal rulebook that says they have to care about this sort of stuff, right? Wrong.

### Failing the mission

Here's Fitbit's stated mission, [from their own website](https://www.fitbit.com/uk/about):

>  To empower and inspire you to live a healthier, more active life. We design products and experiences that fit seamlessly into your life so you can achieve your health and fitness goals, whatever they may be.

If Fitbit's mission is to actively mean something, they should drive internal operations, and customer-facing product design, according to this statement. Here are two ways they're not.

#### "We design products that fit seamlessly into your life"

Except the product doesn't fit seamlessly into your life if you're neither male nor female. Say, if you're the [0.1% of possible market](http://www.isna.org/faq/frequency) that is intersex.

The point of this question is to figure out [Basal metabolic rate (BMR)](https://en.wikipedia.org/wiki/Basal_metabolic_rate). This is, essentially, how many calories you burn each day just by existing (before you add exercise). BMR is affected by, among other things, assigned biological sex, height, and weight. Fitbit cleverly uses this calculation to suggest how much you should eat to meet weight goals, how much you need to keep moving, and so on. I've heard a lot of people refer to BMR as 'metabolism', as in: "you're so lucky, you've got a fast metabolism so can eat all you want".

The reason Fitbit ask for sex (although there's no reason they shouldn't call it 'gender') is to fit with either the [Harris-Benedict equation](https://en.wikipedia.org/wiki/Harris%E2%80%93Benedict_equation) or the newer [Mifflin-St Jeor formula](http://www.freedieting.com/calorie_needs.html), both of which differ for men and women. I assume they don't use the older [Katch-McArdle equation](http://www.jstor.org/stable/41459889?seq=1#page_scan_tab_contents), as (although potentially more accurate) it relies on the user knowing their [Lean Body Mass](https://en.wikipedia.org/wiki/Body_fat_percentage). Katch-McArdle doesn't require knowledge of the user's assigned biological sex.

OK, so it makes sense that Fitbit need to feed Harris-Benedict/Mifflin-St Jeor a biological sex. Asking the user for information isn't the problem, though: the problem is how the product asks for that information. It might seem odd to require that a device asks for personal information in a sensitive way, but this is a mass consumer product enjoyed by thousands of people. It's not unusual for such products to give a damn about how their customers perceive the information extraction process. As a side note, a whole major facet of modern medicine is built around how we should interact with patients to extract useful medical information. It shouldn't be surprising that a product should design a sensitive interaction with its customer base.

So how can Fitbit solve this problem? I'm no great UX designer, but they could 1. name things right and 2. split the choices in three, like many companies have done and like we have done at [Makers Academy](http://makersacademy.com):

You are:

- A Man
- A Woman
- Custom

Under 'Custom', users will know how to answer:

- What sex were you assigned at birth?
- What is your dominant sex hormone? (Estrogen/Testosterone)
- Have you completed menopause?

A helpful little note could remind users that all this information will be kept private. Actually, that very point leads us to the next mission failure.

#### "Achieving health goals...whatever they may be"

One key goal for many trans people is the reduction of [Gender Dysphoria](https://en.wikipedia.org/wiki/Gender_dysphoria) (or the older, less accurate 'Gender Identity Disorder'): distress experienced as a result of a mismatch between assigned gender and reality. The mitigation and reduction of Gender Dysphoria is a _health goal_. Specifically, there is some consensus that it is a [medical goal](http://link.springer.com/article/10.1007/s10508-009-9532-4). There is plenty of evidence available on the improved health outcomes for trans people after medical intervention to reduce Gender Dysphoria (e.g. hormones or surgery), and, anecdotally, trans people have cited exercise (with the goal of controlling physical presentation) as a key medical intervention that has reduced their own dysphoria.

Fitbit appears to want to support this. Here's their line:

> To empower you and inspire you...so you can achieve your health and fitness goals, whatever they may be.

However, a dysphoric user's experience of the current Fitbit product might do the opposite. Imagine for a moment you are non-male, but you chose the 'male' 'gender' option because that will most accurately reflect your BMR.

When you log into your profile, you:

- have the word 'Male' staring at you;
- can't change that to accurately represent you because doing so might render the product innacurate or useless to you, and
- have this incorrect sex/gender/whatever Fitbit thinks it is shared with your friends via public profile.

These might all be reasonable causes for inducing distress: distress experienced as a result of a mismatch between assigned gender and reality. In other words, Fitbit's current approach is not supporting the resolution of Gender Dysphoria, as their mission states. Instead, it's building dysphoric experiences into their product.

### Wrapping up

Fitbit can change these things, and sort this problem: but the evidence so far – for the past three years, at least – suggests they don't want to. If I were being charitable, I might assume their failure to live up to their mission is due to some poor ratios of cost vs. effectiveness in making these changes. That charity doesn't feel justified, though: the market for IoT devices is overwhelmingly skewed toward younger audiences, who are also overwhelmingly likely to express more up-to-date thinking on gender and sex. So, I suspect Fitbit are not paying attention because they just don't think it's a problem.

This isn't uncommon in tech, but it's sad. By now we all know that [gender-diverse companies are 15% more likely to outperform the competition](http://www.mckinsey.com/business-functions/organization/our-insights/why-diversity-matters) and that focussing on attracting diverse talent allows you to access as-yet untapped talent pools. But too few companies - even in tech, where the data are so rich and pointed - are taking this to heart.

It's commonly-known how diverse and inclusive teams can build products for wider markets, simply by virtue of achieving greater understanding of wider demographics. It's also commonly-known that Fitbit really suck at diversity: they were one of the few companies that IPO'd in 2015 [without a single woman on the board](https://www.bloomberg.com/news/articles/2015-06-18/fitbit-counts-on-women-as-device-buyers-just-not-board-members); they are thought of poorly by [women who work there](https://www.inhersight.com/company/fitbit-inc), and Fitbit's management team _still_ [contains no women](https://investor.fitbit.com/governance/management-board-of-directors/default.aspx). To fix this, Fitbit need to focus hard on inclusive thinking, and work out how they can reorient their culture towards inclusive behaviours. 

They could start here.