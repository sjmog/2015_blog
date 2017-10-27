Blog
==

A minimal blog.

Development should be done on the `source` branch.

#### Adding an article

1. Add the article to source/posts. Any `.md` is good, GitHub-flavour markdown.
2. Run `middleman deploy`.

#### Running Compass

Compass was set up to run inside the `source` directory. Stylesheets are generally compiled to `stylesheets/screen.css`, save for specific print and IE styles.

To watch for changes in the `sass` directory, run `compass watch` from the `source` directory.
