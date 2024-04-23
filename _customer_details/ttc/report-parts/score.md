---
title:      Scores
caption:    The cards scores based on the workshop exercise
weight:     40
web-report: true
published:  true
---

During the individual workshops for each area, we had an exercise where the participants had to evaluate and score the five cards that belong to the area. 
Through six workshops over two days we ended up scoring all 30 cards in the model.

The participants were split into smaller groups of 3-4 people, and each group was given one card to score. 
The exercises was to discuss the best-practice described on each card and score them in terms of the four 
[gauges](http://code-maturity.praqma.com/gauges/){: target="_blank"} throughput, feedback, payback and simplicity.

After scoring the cards each group presented their scoring briefly, and the rest of the group had the option to affect or discuss it, if they found a need for it.

![Maturity workshop](/images/report/universalrobots/universal_doing_workshop.jpg){:  .pic .medium .center "}

Throughput, feedback and payback are added together and multiplied by simplicity to calculate the total score on each card.

All the cards that got a score are listed in the following:

{% include report/scores.minimal.html %}

## Analysis
The majority of the cards received some type of score in the value gauges. With the exception of the following

* Automated release notes - received zero on payback
* Test in production - received zero on throughput
* Commits are tied to tasks - received zero on payback
* Version numbers - received zero on throughput

It could be beneficial to revisit the cards, which you scored a zero in one of the value gauges, after reading this report. 
It might have given you inspiration to find the benefits from a holistic view.

### Low hanging fruits

The scoring algorithm favors the simplicity gauge, putting easy-to-implement solutions higher up on the list.

This is a deliberate choice, as it helps identify the aptly named "low-hanging fruits" - ideas that should provide *easy wins* with high value.
These are perfect issues to get started with as the quick gains often help you down the road and help motivate the organization to tackle its bigger, harder-to-solve pains.

Looking at your self-assessment, a few cards stood out:

* Buy-in from management
* Pristine integration branch
* Release train branching strategy

*Buy-in from management* scored a 24 in the *Organization and Culture* category. You have evaluated this quite high in throughput and feedback. 
You gave it two stars for payback and feel it is simple to implement. We agree with this self assessment. 
We feel this is directly related to *how* you are going about paying off technical debt and implementing tasks to improve the way you work. 
Not so much as to whether you are allowed to. More about the approach of making it visible, organizing it better and planning it. 
This score is only a few points from being the *ultimate low hanging fruit*. 

*Pristine integration branch* scored a 21 in the *Version Control* category. You have evaluated this as something that 
is easy to implement but gives fairly high value in feedback and throughput while affecting the architecture quite heavily. 
This is a good view, and to some extent, will not be the most difficult task of the results from this assessment. 
It might be a little more difficult than you anticipate. You need to align the definition of done across the teams and 
get the tooling, a DVCS for example, in place before this can be achieved effectively. Keep in mind that you want to make 
sure you **do not** impede the pace of the team with the automated toll gate. This could be slightly more complex than at 
first glance due to build and architectural dependencies.

*Release train branching strategy* scored an 18 in the *Version Control* category. This was assessed as being easy to implement, 
while giving a high value of throughput and fairly high value on feedback. It is interesting is that you gave it only one 
star for *Payback*. If you keep in mind the requirements a release train will impose on test-ability, trace-ability and 
maintain-ability, you may find that the value return is bigger here than you initially believe. 

Falling back to the cards that score high with two stars in simplicity we get: 

* Code metrics - scored a 16 in *Architecture and Design* category.
* Dependencies are managed - scored a 16 in *Architecture and Design* category.

The code metrics are a sure win and, in reality, should be part of your toll gate to get in to the integration branch. 
It can, generally, be kept fast and give definitive feedback.

The dependency management, on the other hand, will be pretty heavily related to what you already have implemented in this area. 
We know you have some dependency management from Maven. But what about the other technologies in play? How about an aligned 
version strategy that will support dependency management of releases in a good way? There are some rather hard relations 
to the architecture across the technologies here. This might, in reality, be a two in simplicity instead of a one?

### Biggest blockers

Another thing we look for are your major pain points.

Judging the self-assessment scores, we now look further down the list for cards that were judged as very hard to implement 
but giving huge benefits when done.

These are cards that score high in _throughput_, _feedback_ and _payback_ but only a one in _simplicity_ - indicating 
that they are difficult to implement.

There are three cards that stand out here.

* Explicit knowledge transfer
* Delivery Pipeline
* Testable code

The *Explicit knowledge transfer* scored a 9 in *Organization and Culture* category. A full three stars in *Throughput*, *Feedback* and *Payback*. 
But is perceived to be very difficult. This assessment is probably due to the **hero** factor which is exhibited at UR. 
There is also a bit of a low bus factor in the DevOps team, but our clear impression is the difficulty lays with the system complexity and architecture. 
Meaning it is hard to get an overview of the dependencies and how changes may affect the system. 

But the same may also be said about the *Delivery Pipeline* self assessment. This card scored a 9 in *Build* category. 
Again a full three stars across the value gauges but is perceived to very difficult to implement. 
It is, most likely, also rooted in the system complexity, architecture and dependencies. 

Your self assessment on *Testable code* scored an 8 in *Architecture and Design* category. Only a two in the *Throughput* 
but a full three in the other two value gauges, while still being perceived as difficult to implement. 
This is a bit harder to analyse without really looking into the automated tests and the code itself. 

Looking at the three blockers that stand out. 
We could imagine, that we see a **red thread** leading back to the system complexity, architecture and dependencies. What do you think? 

### Outliers
There was one self assessment that we wanted to highlight which did not fit into either low hanging fruits or blockers. 

* Use distributed VCS

*Use distributed VCS* scored a 6 in the *Version Control* category. You scored it a three for *Throughput*, a two for *Feedback* and a one for *Payback*. You perceived it as being difficult to implement. The result is that it does not end as either a low hanging fruit nor a blocker. However, we feel, you will find it difficult to implement an effective branching strategy that will help you in achieving a pristine integration branch in a CI/CD environment without moving to a DVCS. We think the *Payback* may be higher than a one. 

### Our picks for you

If we look at where our focus has been, and where you have self identified the most findings with high priority it falls in the following 7 cards, minus the *Explicit knowledge transfer*. 

* Buy-in from management
* Pristine integration branch
* Release train branching strategy
* Code metrics
* Dependencies are managed
* Delivery Pipeline
* Testable code

Your own picks regarding a release train branching strategy, and a pristine integration branch really fit well with where we could see you putting your focus to start. With the addition of:

* Use a distributed VCS

*Dependencies are managed* and a *Delivery pipeline* also fit well with what we would recommend starting with. Mainly because we think it will give a good starting point for *eating the elephant* as we like to call it. We would also like to point out that the move to a distributed VCS could also help in this regard. It could give you the opportunity to *discover* implicit dependencies. See our solution *Split them with an automated approach* under the finding regarding *Current VCS*.

We left out the *Explicit knowledge transfer* because we feel it is a very difficult blocker to deal with presently. But also because we think that it will be less difficult as you make the, planned, incremental improvements. As you eat the elephant, institute a release train branching strategy, etc, there will be less of a need for hero's.

