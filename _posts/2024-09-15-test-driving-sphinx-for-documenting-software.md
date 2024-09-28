---
layout: post
title:  "Test driving Sphinx for documenting software"
date:   2024-09-16 12:00:00 -0600
categories: blog
tags: software
published: false
---



Well-documented software is easier to use. Good documentation reduces the learning curve and increases the odds that someone coming across your software will become a user. This means that if we want to build software that actually gets used, we need to ensure that our work is documented well.

I've found that software teams who don't invest time into documenting as they go tend to struggle in a few key areas:

- Knowledge is lost when senior team members leave
- New hires spend more time than necessary coming up to speed
- Potential users won't take the time to come up to speed

Similar problems apply to individual developers maintaining personal projects. As stated on the excellent resource [writethedocs.org](https://www.writethedocs.org/guide/writing/beginners-guide-to-docs/#why-write-software-documentation), your code from 6 months ago looks like code that someone else wrote.

For this reason, I'm test-driving a document generator for the first time. In today's blog, I'll share my initial experiences with [Sphinx](https://www.sphinx-doc.org/en/master/index.html).

## Riddle me this

Sphinx is a **[static site generator](https://en.wikipedia.org/wiki/Static_site_generator)** tailored for documentation writing. It generates web pages from plaintext in the same way that [Jekyll](https://jekyllrb.com/) generated the blog post you're reading from a [Markdown](https://www.markdownguide.org/) file. Some of my favorite projects use Sphinx:

- [seaborn](https://seaborn.pydata.org/)
- [Flask](https://flask.palletsprojects.com/en/3.0.x/)
- [SymPy](https://docs.sympy.org/latest/index.html)

Sphinx is, unsurprisingly, very well documented. I started by following along with three guides that they've christened as "The Basics":

- [Installing Sphinx](https://www.sphinx-doc.org/en/master/usage/installation.html)
- [Getting Started](https://www.sphinx-doc.org/en/master/usage/quickstart.html)
- [Build your first project](https://www.sphinx-doc.org/en/master/tutorial/index.html)

Sphinx is distributed through several common package managers. I downloaded Sphinx 8.0.2 from [PyPI](https://pypi.org/project/Sphinx/).

I appreciated how easy it was to generate a basic landing page using the `sphinx-quickstart` script. This tool created a `source/` directory for storing plaintext content and a `build/` directory for storing the static web pages generated after a build.

It also included a [Makefile](https://makefiletutorial.com/) to make building easy. I was able to generate a starter page in HTML using the command:

```shell
make html
```

I ended up with the following landing page:

![Sphinx starter landing page]({% link images/test-driving-sphinx-for-documenting-software/sphinx-starter.png %})

This page was generated from a pair of source files called `conf.py` and `index.rst`. The first is a straightforward configuration file written in Python. I spotted some of the values specified here making their way into the footer.

```py
project = 'adverse'
copyright = '2024, Christian Westbrook'
author = 'Christian Westbrook'
release = 'v0.1.0-pre-alpha'
```

Note that you can specify a theme.

```pytho
html_theme = 'alabaster'
```

I found documentation for Alabaster [here](https://alabaster.readthedocs.io/en/latest/), which looks like it began life as a third-party theme for Sphinx before being selected as the default theme. Nice!

The other file, `index.rst`, is written in a markup language called [reStructuredText](https://docutils.sourceforge.io/rst.html) that I'm not familiar with but that at first glance looks versatile. The file is already short, but here are the relevant lines of source from `index.rst` that made it into the starter page:

```reStructuredText
adverse documentation
=====================

Add your content using ``reStructuredText`` syntax. See the
`reStructuredText <https://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html>`_
documentation for details.


.. toctree::
   :maxdepth: 2
   :caption: Contents:
```

Notice the last three lines in particular. This is a reStructuredText directive that represents a table of contents. In this case, `toctree` is a directive receiving no arguments and with two flags set: `maxdepth` and `caption`. What this directive is missing, keeping it from being rendered on the page, is content. 

The `toctree` directive takes as content the names of pages in the tree. Let's add two new pages to store instructions for installing and using adverse. We'll add two new lines to the `toctree` directive and create the two new pages `installation.rst` and `quickstart.rst` in the `source/` directory. Each page needs at least a title for `toctree` to render it.

Our new `toctree directive` is:

```reStructuredText
.. toctree::
   :maxdepth: 2
   :caption: Contents:

   installation
   quickstart
```

And each of the files `installation.rst` and `quickstart.rst`, respectively, look like this:

```rest
Installation
=====================
```

```reStructuredText
Quickstart
=====================
```

After rebuilding with these minor changes in place, the landing page now looks like this:

![Sphinx starter landing page with new pages Installation and Quickstart]({% link images/test-driving-sphinx-for-documenting-software/sphinx-starter-with-pages.png %})

And just like that, we have a table of contents! Here's what each of the new pages looks like:

![Initial Installation page]({% link images/test-driving-sphinx-for-documenting-software/installation-initial.png %})

![Initial Quickstart page]({% link images/test-driving-sphinx-for-documenting-software/quickstart-initial.png %})

I already love how clean these pages are, and I enjoy that the table of contents is available from the navigation section on any page.

I've been having a ton of fun with static site generators recently. Jekyll made it easy for me to start a blog, and now it looks like Sphinx might help me to produce documentation faster.