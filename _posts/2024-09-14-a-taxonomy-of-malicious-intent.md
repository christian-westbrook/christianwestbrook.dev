---
layout: post
title:  "A taxonomy of malicious intent"
date:   2024-09-14 12:00:00 -0600
categories: jekyll update
published: true
---



Earlier this month, I wrote [a quick introduction to adversarial machine learning]({% post_url 2024-09-09-what-are-adversarial-attacks %}), but I want to dive deeper. In today's blog, we'll consider how an attacker's chosen adversarial attack ultimately depends on how the attack's intended outcomes compare with their goals. Let's dive into it!

## The devil in the details

While every adversarial attack aims to undermine model performance, the degree to which they target a specific outcome varies. Sometimes, the attacker only needs a victim model to make an incorrect prediction. In other cases, the attacker needs the model to make a *specific* incorrect prediction. In Katy Warr's book [Strengthening Deep Neural Networks](https://amzn.to/3ATnK3X), she describes this property as an attack's **specificity**.

Before developing effective countermeasures, we must first understand our adversary's intentions. We want to know the degree to which a given attack seeks to achieve a specific outcome. We can broadly categorize attacks by their specificity to support this goal. The exact attack chosen will depend on how well its intended outcome aligns with the attacker's goals.

Let's take as an example the case of an evasion attack against a classifier. The model intends to assign the correct label to legitimate inputs. The attacker intends to degrade the model by tampering with legitimate inputs and feeding them into the model. Let's walk through the most common goals for an attacker in these scenarios.

## Confidence reduction

Sometimes, the attacker is only interested in weakening the victim model. These attacks aim to erode a model's confidence in the correct predictions. We call these **confidence reduction** attacks. There's no requirement to reach the point where a victim model assigns incorrect labels. In fact, it may even be to the attacker's benefit that the victim model continues producing correct output.

In this situation, the attacker prioritizes subtlety over impact. There's a tradeoff every attacker needs to make between effectiveness and perceptibility. A more effective attack tends to require more drastic manipulation by the attacker. This can make an attack easier for humans or defensive systems to detect. A less immediately effective attack may be able to cause more harm over time by remaining undetected.

Consider the case of two companies competing to sell medical imaging systems to hospitals. The output of a classification model for medical imaging might be a list of possible diseases served alongside confidence scores for each disease. 

What if one company used a confidence reduction attack to reduce the competing system's confidence in predicting the correct diseases? Even if the rival system makes accurate predictions, the offending company may have the chance to influence customers into trusting their system over their competitor's.

## Ready, fire, aim

Other attacks intend to force the victim model into a misprediction without specifying which incorrect class should be predicted. These are called **untargeted attacks**.

Take, for example, an attacker hoping to prevent their phishing emails from being filtered by spam detection systems. In this case, the filter is a machine-learning model trained to detect and label spam emails. The attacker might use an untargeted adversarial attack to craft an email that can evade the filter. This attack would force the victim model into mislabeling the spammer's email.

In this case, the attack doesn't need to compel a specific label from the classifier. It doesn't matter whether the email is mislabeled as personal or as a newsletter. The attack is successful if the spammer's email doesn't register as spam.

## Bullseye

Sometimes, an attacker has the more difficult task of forcing a misprediction into a specific target class. This is known as a **targeted attack**.

Imagine the case of a bank protecting a critical data center with a retinal scanner. Anyone authorized to enter the data center can use the scanner to verify their identity and gain access. Under the hood, a classification model takes retinal images as input and labels them with any known identities as output. Any time someone successfully gains access to the data center, their identity is logged for security auditing.

What if an attacker wanted to ensure that a specific person's identity was never logged on entry? They might choose to craft a targeted evasion attack. A perturbation applied to the retinal scanner's input could cause the classifier to assign this person's scans to someone else's identity.

In this case, it wouldn't be enough for the attack to force a random misprediction. The classifier must be compelled to label the scan with another valid identity for the attack to succeed. The perturbation must be carefully selected for an adversarial example to imperceptibly influence the victim model's label from one class to another.

## Diving deeper

Developing an effective defense for real-world machine learning systems against adversarial attacks will require understanding the attacker's goals. The right defense for the job will depend on whether the attacker seeks to erode model confidence, force general mispredictions, or drive the model toward a specific incorrect label.

Good further reading would be chapter 9 of [Strengthening Deep Neural Networks](https://amzn.to/3ATnK3X) by Katy Warr. To take a more fundamental look at adversarial machine learning, check out this [brief introduction to the field]({% post_url 2024-09-09-what-are-adversarial-attacks %}). In future posts, we'll explore how to harden models against these adversarial threats.
