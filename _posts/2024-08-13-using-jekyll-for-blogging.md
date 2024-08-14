---
layout: post
title: "A blogging pipeline with Typora, Jekyll, and GitHub Pages"
date: 2024-08-13 20:00:00 -600
categories: post
tags: tutorial
published: false
---

Hello, world, and welcome back to the blog! Today I want to share how I've increased my capacity for writing and publishing blog posts by finding the right set of tools to build a workflow that works for me. 

In this post I'll take you along for the ride that led me to this point before breaking down how I stood up this blog and then sharing my workflow for writing and publishing blog posts. While the tools I discovered along the way were undoubtedly important, the biggest shift for me was actually a mental one, and so I'll break that down too. 

My hope is that learning what's working for me might help you to build a workflow that will work for you as well. Let's dive right into it!

# Table of Contents

[The Markdown lowdown](#the-markdown-lowdown)
[Discovering Jekyll and static site generation](#discovering-jekyll-and-static-site-generation)

## The Markdown lowdown

Every story needs to begin somewhere, and so I guess I'll kick this one off by sharing the fact that I *really* love using [Markdown](https://www.markdownguide.org/).

Markdown is an incredibly simple markup language (the pun *has* to be intended) that you can use to easily write and format just about any kind of document. One of Markdown's main selling points for me is its integration with repository hosting giants GitHub and GitLab. Most software repositories will contain, at a bare minimum, the Markdown file `README.md` for expressing how to install and make use of the provided software.

I've also used Markdown to write project proposals, document software, record architectural decisions, and yes, even to write blog posts! Don't worry, we'll circle back to that.

About a year ago I started looking for an improved text editor that would help me to stay focused for longer periods of productivity while writing, Markdown or otherwise. Two editors that stood out to me were Hemingway and Typora.

Hemingway 



I tried out [Hemingway](https://hemingwayapp.com) and  and  Along the way I found a desktop Markdown editor called Typora that actually helped 

About a year ago I started using a desktop Markdown editor called [Typora](https://typora.io/) in an attempt to increase my capacity for focused writing and, quite surprisingly to me, it actually stuck. Typora's minimalist interface worked so well that it even got me thinking about how very *nice* it could be to write blog posts completely in Markdown that were immediately publishable without any extra steps for formatting or conversion. In fact, I had already tried to solve this problem a different way more more than a year prior through a side project I called [Anansi](https://github.com/christian-westbrook/anansi).

![Image of Anansi GitHub]({% link docs/assets/anansi.png %})

Anansi's stated purpose is to serve as an open-source blogging and portfolio engine that anyone can use to own their story. I developed Anansi completely from scratch and used it to host my blog at [christianwestbrook.dev](https://www.christianwestbrook.dev). The primary tradeoff in developing my own platform was to gain complete ownership and control over my content in return for giving away the ease of starting up and the quality of tools granted by an established blogging platform. 

I wanted to develop a blog engine that could read blog files in a standard format so that the front-end could easily be adjusted without requiring any changes to a (presumably) growing store of blog files. At the time I had been working professionally in JavaScript and JSON, so naturally I chose PHP for developing the engine and XML as a file format. I knew that it could be flexible enough to support Anansi's needs, and I hadn't ever really played with XML files before. Sometimes in side projects I choose technology stacks simply for the experience of trying something new, and I'd highly recommend that others do the same.

The MVP of Anansi was a parser for converting XML blog files to HTML content and a mechanism for rendering that content into a feed on a simple web page. It ended up working very well, and I was able to write and drop off XML files representing simple blog posts into a common directory for easy publishing. With that mission accomplished, the blocker became the process of creating the XML files.

Authoring a blog post for Anansi involved writing the blog itself in a separate editor and then manually porting its content into the XML format required for Anansi to work. If I made a change to a blog file in the editor, then I'd have to port it to XML again. My next thought, naturally, was whether there was a standard file format that I could use to write blog posts more easily than with XML. Maybe I could build a tool for converting *that* standard format into XML for use by Anansi? Or, even better, what if I could render directly from some standard and easy to work with file format? Wherever could such a file format be?

I'll circle back now to my love for Markdown. Long before using Typora I was regularly making use of Markdown at school and at work to write technical documents, but it was using Typora that actually triggered the idea. I envisioned authoring blog posts *directly in* Markdown, whose tagged elements are remarkably similar to HTML, and then dropping them off, completely carefree, into a common folder from which Anansi would render them to form a blog feed. Incidentally, this is precisely the capability that Jekyll provides for us.

## Discovering Jekyll and static site generation

Working on GitHub over time had repeatedly exposed me to the terms "Jekyll" and "static site generation", but it wasn't until I began looking for examples of Markdown parsers that I stopped long enough to realize the connection between Jekyll and what I was trying to do with Anansi.

A static site generator is a tool that converts data structures into static HTML web pages. [Jekyll](https://jekyllrb.com/), a static site generator written in [Ruby](https://www.ruby-lang.org/en/), is the tool that powers GitHub Pages and provides complete support for Markdown right out of the box!

## Getting started with Jekyll and GitHub Pages