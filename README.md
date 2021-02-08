Blog
==

A minimal blog.

Development should be done on the `source` branch.

> You'll need Bundler 1.1 to install Middleman 3. To do that, `gem uninstall bundler` and `gem install bundler -v 1.1`. Remember to reinstall your original Bundler at the end!

#### Adding an article

1. Add the article to source/posts. Any `.md` is good, GitHub-flavour markdown.
2. Run `middleman deploy`.

#### Running Compass

Compass was set up to run inside the `source` directory. Stylesheets are generally compiled to `stylesheets/screen.css`, save for specific print and IE styles.

To watch for changes in the `sass` directory, run `compass watch` from the `source` directory.
