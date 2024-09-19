---
layout: post
title:  "What are adversarial attacks?"
date:   2024-09-09 12:00:00 -0600
categories: blog
tags: adversarial
published: true
---

Machine learning is booming. Engineers and researchers can field new applications faster than ever before. Machine learning models recommend our music, filter the media we consume, and diagnose our diseases. Virtually every industry is being simultaneously disrupted and revolutionized by machine learning.

But behind our increased dependence on machine learning there lies a hidden danger. **Machine learning models can be forced to make incorrect predictions.** In certain scenarios the consequences of a coerced misprediction could be tragic.

What if an attacker could convince a self-driving car that a stop sign is really a speed-limit sign? What if they could force a medical imaging system to misdiagnose a patient's disease?

These situations might seem farfetched, but research confirms that the threat is real. Machine learning models are vulnerable to an emerging class of exploits known as **adversarial attacks.**

But what is the threat exactly? How do adversarial attacks work, and how can they exploit our models? For the past two years I've been exploring the world of adversarial machine learning. Today I'll begin breaking down this exciting field of research for anyone looking to gain a deeper understanding of it. Let's dive into it!

## Place your bets

While there are many different kinds of machine learning models, they all have some things in common. Models are like functions. They map some input to some prediction as an output. Machine learning models are so powerful because they can make useful predictions. We can use models that make good predictions to make good decisions.

Let's use a self-driving car as a running example. The vehicle uses a model called a road sign classifier to identify road signs. The model takes an image of the road as input and generates a prediction about any road signs present as output. When the vehicle notices an approaching stop sign, it makes the decision to apply the brakes. This important decision depends on the model to make good predictions.

But a new model can't make useful predictions out of the box. We need to train a model before it can become useful. This process involves exposing the model to many different examples of input. With the right volume and variety of examples, a model can learn to make accurate predictions. This is the "learning" part of the term machine learning. 

But this leads us to our problem. We can't expose a model to every possible input. Consider the many possible angles and weather conditions for images of stop signs. Our training examples can only ever represent a small portion of the possible inputs. Adversarial attacks take advantage of this to force models into making bad predictions.

## Cloak and dagger

The approach is subtle. An attacker searches for seemingly authentic inputs that weren't represented during training. These inputs are more difficult for the model to predict. Some will cause an otherwise accurate model to make the wrong prediction. We call inputs that were intentionally crafted to mislead a model **adversarial examples**.

It's easier than you would think to produce adversarial examples. The attacker can begin with any known good input and introduce small changes until they become adversarial. We call these changes **adversarial perturbations**. An example might be the slight discoloration of a few pixels in an image. The same algorithms used for learning are used to find optimal perturbations. Oftentimes, the changes needed to convert a good input into a bad one are *imperceptible*.

Once obtained, there are a few different ways that an attacker can use their example to exploit a model. If the target model is already deployed, the attacker can feed their example back into the model as input. This would force the victim model to mispredict. We call this kind of adversarial attack an **evasion attack**.

Some attacks target models that are still in the training process. Malicious examples introduced at this point might allow an attacker to influence model behavior. We describe tampering with the training set like this as **data poisoning**.

Through data poisoning, an attacker might even manage to teach the model a hidden pattern. Later, the attacker could trigger this hidden pattern with a follow-up evasion attack. We would call this scenario a **backdoor attack**. 

There are many different kinds of adversarial attacks, but these are some of the most common. In each case the attacker's power lies in their ability to force a model to mispredict.

## Brace for impact

The effect of a forced misprediction depends on the model's responsibilities. Any decisions made by the victim model are at risk.

Let's illustrate this with a familiar example. A [conference paper](https://arxiv.org/abs/1707.08945) from 2018 showcased an adversarial attack on a self-driving car. They carried out the attack physically by applying strips of black and white tape to a stop sign. The tape itself was meant to resemble graffiti to avoid detection by any human observers. The authors managed to fool the vehicle into treating the stop sign as a speed limit sign. This is a striking example of the risk posed by adversarial attacks.

## Diving deeper

This brief introduction has been only the tip of the iceberg. Research in adversarial machine learning is experiencing a Cambrian explosion. New and improved adversarial attacks are published all the time. As our understanding of the threat grows, so too does our need for new defenses. At first glance this new arms may seem daunting.

Fortunately there are many great resources available to ground yourself in the field. A great place to start would be with the book [Strengthening Deep Neural Networks](https://www.amazon.com/Strengthening-Deep-Neural-Networks-Susceptible/dp/1492044954) by Katy Warr. This intuitive book lays the groundwork for understanding adversarial attacks and defenses. I personally enjoyed having access to so many quality source code examples.

For a more immediate hands-on approach, check out an attack library. Two of the most relevant open-source libraries are [foolbox](https://github.com/bethgelab/foolbox) and [cleverhans](https://github.com/cleverhans-lab/cleverhans). Each is written in Python and can interface with PyTorch, Jax, and TensorFlow.

While many resources focus specifically on deep neural networks, this [excellent introduction to adversarial robustness](https://adversarial-ml-tutorial.org/) has a chapter that specifically covers attacks on linear models.

You'll also find more content related to adversarial machine learning here on the blog. For instance,  [this discussion on understanding attack outcomes]({% post_url 2024-09-14-a-taxonomy-of-malicious-intent %}). In upcoming posts I plan to dive deeper into attack algorithms and common defenses. There's a lot to explore here, and I'm so very excited to share the journey with you.