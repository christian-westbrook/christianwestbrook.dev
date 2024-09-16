---
layout: post
title:  "Shapeshifting with isometries"
date:   2024-09-14 12:00:00 -0600
categories: blog
tags: geometry
published: false
---

Hello, world, and welcome back to the blog!

Transformations are the building blocks of geometry. Today I want to explore a fun class of geometric transformations called isometries. Let's dive into it!

## Useful moves

Geometric transformations are incredibly useful. When a modern video game character moves across the screen, you're witnessing tens of thousands of simultaneous geometric transformations. The mechatronic arms that automate manufacturing in smart factories use geometric transformations to plan their motion. Spacecraft exploring the solar system use geometric transformations to reach their destinations safely and to avoid hazards while they're there.

Isometries are a special class of geometric transformation. The word "isometric" means "equal measurement". It's fitting, then, that an **isometry** is a geometric transformation that preserves distances. Let's walk through a series of increasingly specific terms that build to an isometry to understand what this really means.

## Functioning

Let's begin with functions. We can think of a **function** as a tool that converts one set into another set. In particular, a function will associate each element of one set to exactly one element in another set. For example, given the sets

$$ A = \{1, 2, 3, 4\} $$

$$ B = \{a, b, c, d\} $$

the function $$ f $$ might map 

$$ 1 \rightarrow a $$ 

$$ 2 \rightarrow b $$

$$ 3 \rightarrow c $$

$$ 4 \rightarrow d $$

We can write "the function $$ f $$ such that $$ A $$ maps to $$ B $$ " like $$ f : A \rightarrow B $$. Similarly, we can show how each element of $$ A $$ is converted by $$ f $$ to an element of $$ B $$ using the notation

$$ f(1) = a $$

$$ f(2) = b $$

$$ f(3) = c $$

$$ f(4) = d $$

## Rollback and restore

A bijection is a special kind of function with an extra requirement. Let's now be a little more precise in how we describe the sets being transformed to understand the difference.

In our previous example, the original set $$ A $$ to be converted by function $$ f $$ is called the **domain**. The set $$ B $$ that is being mapped to is called the **codomain**.

A function maps every element of the domain to exactly one element of the codomain. This is like every person at a wedding being assigned to a unique seat.

In addition to this requirement, a **bijection** also requires that every element of the codomain is associated with exactly one element from the domain. This is like a wedding with the perfect seating chart where everyone has a seat and no seat is unused.

Let's take as an example the sets

$$ C = \{ 26, 25, 24 \} $$

$$ D = \{z, y, x, w \} $$

and a function $$ g : C \rightarrow D $$ where

$$ g(26) = z $$

$$ g(25) = y $$

$$ g(24) = x $$

In this case, $$ g $$ is a function but *is not a bijection* because the element $$ w $$ in $$ D $$ has no associated element in $$ C $$. Going back to our original example with the sets

$$ A = \{1, 2, 3, 4\} $$

$$ B = \{ a, b, c, d \} $$

The function $$ f : A \rightarrow B $$ was a bijection because there were no unused elements in B.

This extra requirement gives bijective functions the special property of being reversible. If $$ f : A \rightarrow B $$ is a bijection, then there also exists some function $$ h : B \rightarrow A $$ that maps each element in $$ B $$ back to the originally associated element in $$ A $$.

## Transformers

We can think of a **geometric transformation** as a bijection for points in a geometric space. Most commonly this is a mapping of the set of all points on a plane of real numbers to itself. That is to say that for all points $$ P $$ on a two-dimensional plane of real numbers $$ \mathbb{R}^{2} $$, we commonly find geometric transformations $$ f : \mathbb{R}^{2} \rightarrow \mathbb{R}^{2} $$. One example of a geometric transformation is a dilation.

Consider the points $$ P $$ = (1, 1) and $$ Q = (3, 3) $$ in two-dimensional Euclidean space.

## Let's get isometric





