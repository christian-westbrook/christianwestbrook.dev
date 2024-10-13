---
layout: post
title:  "Building the 16-bit Computer 'Hack' from Nand2Tetris! Part 1 - From Nand to Multiplexers"
date:   2024-10-12 18:00:00 -0600
categories: blog
tags: hardware
published: true
---

2024 has been a year of discovery with computing. After taking a pair of advanced computer architecture courses in the Spring, I've become entranced by the idea of designing and iterating on a simple CPU as a side project.

This past weekend, I took my first steps toward that goal. I started reading and working through the book *The Elements of Computing Systems* by Noam Nisan and Shimon Schocken, also known as [*Nand2Tetris*](https://www.nand2tetris.org/).

The book's scope is impressive. Starting from Nand gates, it promises to walk the reader through building a modern computer capable of running Tetris from first principles. This includes implementing an ALU, CPU, instruction set architecture, assembler, programming language, compiler, and operating system. 

The authors make what would otherwise be a daunting project easy to approach by providing the design and interface of each layer of the computing stack up front. The reader is tasked with implementing each layer's interface using only the components created in the previous layer. 

Each chapter introduces a new layer from the bottom up and a project that depends on the previously implemented layers. The cherry on top is that every project can be completed in [a single cohesive IDE accessible through a web browser](https://nand2tetris.github.io/web-ide/chip/). I can't commend the authors enough for the seamless experience.

I'll begin documenting my journey through the Nand2Tetris book and project in today's blog. While the authors request that readers refrain from making their solutions public, I'll still be able to discuss what I'm building in each layer, any problems I ran into, and anything interesting I learned. My long-term goal will be to design and iterate on my own computing stack using the lessons learned from this project.

Today, I'll start by sharing how the first chapter of *The Elements of Computing Systems* went for me. Let's dive into it!

The book is organized into 12 chapters. The first six build up to an implementation of the project's computer, a 16-bit architecture called *Hack*. The first chapter introduces the reader to the primitive and composite logic gates that make up the *Hack* architecture.

The vast majority of computers are digital devices. This means that computers usually process binary data (i.e., 1s and 0s) rather than continuous data. The cell phone next to me and the laptop I'm using to write this blog post each contain digital computers.

The alternative to digital computing is analog computing. Analog computers process continuous data and are still valuable for specific use cases. In particular, I've found analog computers near sensing instruments in signal processing chains. These computers are designed to accelerate particular computations and, as such, are usually less suitable for general computing needs.

The *Hack* architecture proposed in Nand2Tetris is a general-purpose digital computer designed to quickly introduce readers to the most common elements of computer architecture. This means that we can begin to understand how *Hack* and other digital computers work by viewing them through the lens of Boolean algebra. 

Boolean algebra is a branch of algebra focused on manipulating $$ true $$ and $$ false $$  values. This is perfect for working with the binary data processed by digital computers!

We can represent the value $$ true $$ as a 1, a switch that is set to on, or even a specific voltage (commonly 5V or 3.3V). Similarly, we can represent the value $$ false $$ as a 0, a switch that is off, or even a second pre-determined voltage (commonly 0V). You'll find literature on digital systems often jumping around between these representations. At the lowest levels, modern computers consist of physical circuits that realize Boolean functions. The most elementary of these are known as logic gates.

A logic gate is a physical device that implements a Boolean function. Some common examples of Boolean functions are $$ Not() $$, $$ And() $$, and $$ Or() $$. Each of these functions works how you expect them to work.

Given a single input $$ x \in \{0, 1\} $$, the Boolean function $$ Not() $$ inverts the input from true to false or from false to true. For instance, if $$ x = 1 $$, then $$ Not(x) = 0 $$, and if $$ x = 0 $$, then $$ Not(x) = 1 $$.

Given two inputs $$ x, y \in \{0, 1\} $$, the Boolean function $$ And(x, y) $$ tells us whether $$ x $$ and $$ y $$ are simultaneously true. For instance, if $$ x = 1 $$ and $$ y = 1 $$, then $$ And(x, y) = 1 $$.  If $$ x = 1 $$ and $$ y = 0 $$, then $$ And(x, y) = 0 $$ because $$ x $$ and $$ y $$ are not simultaneously true.

Given two inputs $$ x, y \in \{0, 1\} $$, the Boolean function $$ Or(x, y) $$ tells us whether either $$ x $$ or $$ y $$ is true. For instance, if $$ x = 1 $$ and $$ y = 0 $$, then $$ Or(x, y) = 1 $$ because at least one of the inputs (in this case $$ x $$) is true. If $$ x = 0 $$ and $$ y = 0 $$, then $$ Or(x, y) $$ = 0 because neither $$ x $$ nor $$ y $$ are true.

It turns out, as demonstrated in an appendix of *The Elements of Computing Systems*, that *any* Boolean function can be expressed as a combination of $$ Not() $$, $$ And() $$, and $$ Or() $$ gates. This result stems from a chain of inferences:

- Any Boolean function can be represented using Boolean expressions
- Any Boolean expression can be represented by a single truth table
- While any given truth table might be represented by any number of Boolean expressions, every truth table can be represented by a specific Boolean expression known as *disjunctive normal form* (DNF) that uses only $$ And() $$, $$ Or() $$, and $$ Not() $$ operations
- Therefore, any Boolean function can be represented by some combination of $$ And() $$, $$ Or() $$, and $$ Not() $$ operations

This means that we could build a computer entirely from $$ And() $$, $$ Or() $$, and $$ Not() $$ gates! To take this idea further, if any elementary Boolean function could represent all three of these functions, we could build an entire computer from a single logic gate! 

Remarkably, it just happens that we can represent each of these three functions using only the mighty $$ Nand() $$ function, shorthand for "not and." There are others, such as the $$ Nor() $$ function, but for now, we'll focus on $$ Nand() $$ for its use in the Nand2Tetris course.

Given two inputs $$ x, y \in \{0, 1\} $$, the Boolean function $$ Nand() $$ tells us if either $$ x $$ or $$ y $$ is false. For instance, if $$ x = 0 $$ and $$ y = 1 $$, then $$ Nand(x, y) = 1 $$ because $$ x $$ is false. If $$ x = 1 $$ and $$ y = 1 $$, then $$ Nand(x, y) = 0 $$ because neither $$ x $$ nor $$ y $$ is false.

How do we get from $$ Not() $$, $$ And() $$, and $$ Or() $$ to $$ Nand() $$? We'll start with De Morgan's laws.

De Morgan's laws are transformations for Boolean expressions containing $$ And() $$, $$ Or() $$, and $$ Not() $$ operations. De Morgan's laws can be expressed using our previously defined Boolean functions as follows:

- $$ Not(And(x, y)) = Or(Not(x), Not(y)) $$
- $$ Not(Or(x, y)) = And(Not(x), Not(y)) $$

Similarly, in English, we could say the following:

- The phrase "not x and y" is equal to "not x or not y"
- The phrase "not x or y" is equal to "not x and not y"

This gives us a transformation for Boolean expressions using $$ Not() $$ and $$ And() $$ to equivalent expressions using $$ Not() $$ and $$ Or() $$, and vice versa. We can use this transformation to express a Boolean function that uses $$ Not() $$, $$ And() $$, and $$ Or() $$ to either use only $$ Not() $$ and $$ And() $$ or to use only $$ Not() $$ and $$ Or() $$. 

This means that we can build a computer using only $$ Not() $$ and $$ And() $$ gates (or $$ Not() $$ and $$ Or() $$ gates)! We can take the final step towards representing any Boolean function using only $$ Nand() $$ operations by demonstrating that we can express $$ Not() $$ and $$ And() $$ using only $$ Nand() $$. 

We can indeed express $$ Not() $$ using only $$ Nand() $$. This is a crucial problem to be solved by the reader in *The Elements of Computing Systems*, so I'll leave the proof of this as an exercise. Once you have expressed a $$ Not() $$ function using only $$ Nand() $$, you can easily express $$ And() $$ using the expression $$ Not(Nand()) $$. 

Therefore, discovering how to express $$ Not() $$ using only $$ Nand() $$ is the key to building a computer entirely from $$ Nand() $$ gates!

The first chapter of the book, and one of its appendices, walks the reader through this proof and realization before tackling how to build more complex "chips" from these more fundamental gates. Each chip has an interface expressing what it takes as an input and what it provides as an output. 

Chips are implemented in the [Nand2Tetris IDE](https://nand2tetris.github.io/web-ide/chip/) using a hardware description language (HDL). Note that the authors intentionally decided against having readers use either of the industry-standard hardware description languages VHDL or Verilog. The authors attempt at every step to move vendor-specific details and obstacles away from the spotlight so that readers can focus on building generally transferrable skills.

Given one chip representing a $$ Nand() $$ gate, the reader is tasked with implementing a pre-defined collection of 15 chips required by the *Hack* architecture, all of which we now know can be expressed using $$ Nand() $$ gates. Each chip implementation depends on previously implemented chips. For instance, once you've implemented the first chip $$ Not() $$, you can easily implement the second chip $$ And() $$ as $$ Not(Nand()) $$ rather than using only $$ Nand() $$ gates directly.

After working through the basics, the more complex chips you need to implement in the first chapter include the *multiplexer* and *demultiplexer*.

A multiplexer, or "mux," is a chip that can be used to select an input signal as an output. For instance, if $$ x $$ and $$ y $$ are each digital inputs, then given the binary signal $$ select $$, a multiplexer $$ Mux(x, y, select) $$ might output $$ x $$ if $$ select = 0 $$ or $$ y $$ if $$ select = 1 $$.

A demultiplexer, or "demux," is a similar chip that instead selects an output for a single input signal. For instance, if $$ in $$ is a single input signal, $$ x $$ and $$ y $$ are output signals, and a binary signal $$ select $$, the demultiplexer $$ Demux(in, select, x, y) $$ might write $$ in $$ to $$ x $$ and 0 to $$ y $$ if $$ select = 0 $$, or 0 to $$ x $$ and $$ in $$ to $$ y $$ if $$ select = 1 $$.

Each of these is more challenging to implement than the previous, more elementary chips. I found solutions to each by starting with their truth tables, writing out a Boolean expression of each in distributed normal form (DNF), and then using a combination of De Morgan's laws and the Boolean algebra described earlier in the book to simplify each expression.

I'm not sure if I reached the simplest possible solutions, but I did manage to express a mux selecting between two inputs using only four gates and a demux selecting between two outputs using only three gates. I'd love to know if you could find a solution using fewer gates!

After building the fundamental gates and multiplexers, the next task is to make 16-bit versions of the gates $$ And() $$, $$ Or() $$, and $$ Not() $$, a 16-bit version of $$ Mux() $$, and an eight-way version of $$ Or() $$ that can sense whether any of eight inputs are set to on. These chips were very straightforward to build, given their corresponding gates. I was able to express each as a combination of their simpler variants.

The final chips to implement were a much more significant challenge for me. These are multiway muxes and demuxes. For example, the $$ Mux4Way16() $$ chip selects between four different 16-bit input signals, while the $$ DMux8Way() $$ chip selects between eight different 1-bit output signals. Although it took me a while to see it, each of these chips can be expressed as combinations of simpler muxes and demuxes.

At the end of this chapter and its corresponding project, we have 16 different chips to work with while building the *Hack* computer! All in all, the project for this chapter took me around four hours to complete in a single evening. I had a great experience working with the Nand2Tetris IDE, and I'm already looking forward to using these chips to build an ALU in the next chapter.
