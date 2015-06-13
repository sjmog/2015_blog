Blog
==

A minimal blog for 2015.

Development should be done on the `source` branch.

#### Adding an article

1. Add the article to source/posts. Any `.md` is good, GitHub-flavour markdown.
2. Run `middleman deploy`.

#### Running Compass

Compass was set up to run inside the `source` directory. Stylesheets are generally compiled to `stylesheets/screen.css`, save for specific print and IE styles.

To run Compass, run `compass watch` from the `source` directory.
