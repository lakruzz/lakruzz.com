---
# cspell:ignore  Phhhew
title: Lakruzz' Law
author: Lars Kruse
search: true
author_profile: rue
cross-posts:
  - https://www.inc-inc.dk/stories/lakruzz-law/
header:
  teaser: /assets/images/posts/lakruzzlaw/lakruzzlaw-trimmed.png
tags:
  - lakruzzlaw
  - conwayslaw
  - toolstacks
  - devops
excerpt: Any organization that sets out on a certain toolstack (processes included) will remain on that exact stack until eternity or end-of-life whichever comes first.
---

![image-center]({{ page.header.teaser }}){: .align-center width="80%"}

Do you recall Conway's Law: _"Any organization that designs a system (defined broadly) will produce a design whose structure is a copy of the organization's communication structure."_
{: .kicker}

It was made famous by Melvin Conway's friend and colleague Fred Brooks in the fabled book "The Mythical man month" which predates any mention of _DevOps_ or _SAFe<sup>®</sup>._ Not even the terms _lean_, _agile_ or _scrum_ was invented when Brooks published his book in 1972.

Conway's Law mentions "design" and "systems". The simile "architecture" obtained from the building/construction domain wasn't introduced in software development in 1967 where Conway first made the statement. But today we would refer to it as System Architecture. The gist of Conway's law is really:

>Show me your system architecture chart, and I can back-track to your organization chart

During my work as an IT consultant I've come across what feels like thousands of system architectures, and I've always been stoked about how true that prediction really is. How siloed organizations actually work. Most developers (back then of course) would rather build interfaces to their colleagues, than to collaborate with them. The ruling thought among the average developer (not you, but the others) seem to be: _"I'll put any piece of code that derives from a colleague in my own department in the module or component, but anything else will have to be fenced out and only included through some kind og interface"._

It really gives the die hard rule-of-thumb in system architecture _High Cohesion, Low Coupling_ a completely different flavor doesn't it?

When analyzed, it seems to be a collaboration issue causing this effect. Software is complex. It calls for a lot of communication on the side. If people aren't close by, if they don't share lunch and coffee on a daily basis, then they can't understand each others code.

...back then.

## But then came _DevOps_ to the rescue!

Yes, and before that _agile_, _scrum_, _lean software development_, _Continuous Delivery_ and later _serverless_, _containers_ and _cloud native_.

So now we're all OK. Phhhew!

DevOps tear down the silos. DevOps magically makes Dev and Ops love each other and become united in a holistic flow of high quality software. And not just Dev and Ops. The DevOps Culture makes _everybody_ love _everybody_ and it tears down _all_ silos in the organization. So luckily modern software products don't suffer from that problem stated by Conway's Law anymore.

Or do they?

One could argue, that it _is_ probably getting just a tiny bit harder to predict an organization chart simply by the glance of an architectural drawing of the system. There architectures is more distributed, smaller components, more interfaces, which are more efficient. But personally I believe it's to be less due to DevOps culture and agile method frameworks and more a consequence of the combination of the nowadays more common distributed nature of companies. The fact that contemporary tool stacks are more heavily utilizing REST and GraphQl API's. The popularity of hosted collaboration platforms like Azure DevOps, GitHub, GitLab and Bitbucket.

Interfaces have improved and organizations has become more diffuse - and so has the system architectures; Conway's law still holds.

But I've made the observation that _another_ tell has snug into almost every snippet of system architecture out there, which will also reveal quite a lot about the organization behind the software release: It' about the tool stack itself.

So I'll postulate __Lakruzz' Law:__

>Any organization that sets out on a certain tool stack (processes included) will remain on that exact stack until eternity or end-of-life whichever comes first.

The observation, stated as my law above, is essentially nothing but a tool stack variant of the Conway's original Law.

I often find that a company's tool-stack and process framework is like a snapshot back in time. It captures what was contemporary and _comme il faut_ at the time when the software product was being conceived.

Companies seem to have picked their _modern_ tool stack at the time of creation. Believing that _"Surely this tool stack will carry us all the way into the future and beyond! - what could possibly go wrong?"_. But sadly; almost _any_ company is then tied down by overwhelming software complexity and technical debt. Soon enough their (any) tool stack fall back to appeal only to _late majority_ and _laggards._ The rest has moved on. And they simply don't have the resources to keep up with modern stacks.

Based on a listing of the tool stack and the process method frameworks I can usually predict intel about a company like:

- When was the company founded (or start utilizing IT)?
- What type of management or leadership do they have?
- What's their recruitment and retention strategy?
- How are they funded?
- What's their market fit and user segment?
- What's their workplace policy?
- Do the depend on contract workers?
- Do people like working there?

I've seen traditional hipster/hacker/hustler startups with great success and hockey sticking valuations who are equally predictable: After onboarding only the first few four-digit number of users, they are helplessly tied to their hack of Postgres database, their docker containers, and their Python scripts. And they will never leave it.

## Really? Is there no escape?

There is!

- If the company truly embraced IT as an enabler, as opposed to a cost center that constantly need to be minimized or contained.
- If they encourage developers to remain playful and exploratory about emerging technologies.
- If' they're not afraid of releasing and deploying code at the speed developers can actually produce it.
- If they can build quality in - as opposed to gluing it on and restrain from building up technical debt.

Then their tool stack is probably constantly being added to and subtracted from. Then they would be progressing and the tool stack wouldn't merely be a snapshot of their time of birth.

But:

It's a small portion of organizations, who are not being eaten by Software<br/>
But rather eat software for breakfast
{: .kicker}

A place that eats software for breakfast? That's a place I'd like to work!
