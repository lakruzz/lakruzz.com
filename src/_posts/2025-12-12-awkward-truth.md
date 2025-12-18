---
published: true
title: Awkward truth
author: Lars Kruse
search: false
author_profile: true
header:
  teaser: /assets/images/posts/lies/also-true.png
tags:
  - awkward truth
excerpt: '"Blessed are the liars - for the truth can be akward". A tale of my two year encounter with the inside of .the tech collective — powered by Implement'
# cspell:ignore im_ .ttc naah ooooh rasmus ahhhhm
---

![image-center]({{ page.header.teaser }}){: .align-center width="80%"}

Blessed are the bullies, For one day they will have to stand up to themselves<br/>
Blessed are the liars, For the truth can be awkward[^americansoul]"
{: .kicker}

[^americansoul]: The quote in the kicker is from the intro in U2's "American Soul" (2017)

## The ambush

One day — a Thursday when I was working from home — I entered a planned video meeting with two colleagues. It was just an informal status call on our joint effort to introduce and roll out a new standard tool to improve transparency in our software team of ten developers. The agenda itself was so insignificant that, only an hour earlier, I debated with my colleague if I was even needed in the call, but he insisted that my knowledge and insight on the specific tool was appreciated and he would like me in the call.

So I joined as requested.

My two colleagues were not working from home that day. They sat together in a meeting at our office space in the heart of Copenhagen.

One of the colleagues in the meeting is a partner in _Implement Consulting Group (IM_)_ the other is junior partner in the _The Tech Collective_ hub called  _Test & DevOps (t&do)_ where I'm also employed. Despite the fact that the Implement partner is also the official sponsor of the overarching _brand:_ The Tech Collective, I had never actually seen him visit our office-space. I made a comment on that: _"Ooooh, you are visiting us, how pleasant! Had I known, I would have come in too."_

An awkward silence followed. _Too_ awkward. Before the silence broke I got to think; _"Did my remark offend them? Naah! That could not be it, it was an innocent pleasantry remark – something is off!"_

**_Implement Consulting Group_** is a traditional partner-run management consulting bureau (~1800 employees, ~200+ are partners). Every Implement employee is on a personal KPI, you must invoice your KPI — or you will loose either your bonus or your job. In 2020 Implemented founded the brand **_The Tech Collective_**, an initiative designed to _also_ deliver tech resources. **_The Tech Collective_** is merely a brand that operates eight individual hubs. Partners proudly refer to the hubs as _startups._ Like a true startup, each hub is an individual legal incorporation. But unlike a true startup, only a very small portion of shares can be obtained by _partners_ — in this setting the equivalent to a startup _founder_. The majority of the shares — min 80% — will remain on the hands of IM_. In our hub the KPI is not tied to individuals, instead the entire hub has an accumulated joint hub KPI.
{: .fact .right .medium}

My own _Test & DevOps_ colleague is also my everyday _partner in crime;_ he and I built this successful team of now ten software developers from a green field together. Each hub has it's own founder story. The _Test & DevOps_ hub was founded as a body-shop for Test Managers by a single partner and Implement. _DevOps_ was in the name from the beginning, but no actual DevOps business or even initiative had been established during the first two and a half year up until I was brought in. My designated task was to lead and to establish that specific DevOps business — together with my colleague, now in this meeting. He had been made a partner in _Test & DevOps_ only a few month before I joined.

My own _Test & DevOps_ colleague in the meeting is also my personal _Focus Contract Leader (FCL)_ — a term IM_ use to define the person who is assigned to mentor you in your aspiration to grow.

My own _Test & DevOps_ colleague is also the one who breaks the awkward silence after my pleasantry remark:

> _"Ahhhhm ...this meeting has a different agenda than the one we called for. We're letting you go. With effect of immediately. Your access to our infrastructure will be revoked after - maybe even during — this meeting"_

The pause that follows is _very_ long, until finally my own  _Test & DevOps_ colleague asks _"would you like to know the cause?"_ I concent _"if you care to elaborate."_

> _"It has come to our attention, that at one point you have caused a colleague to cry"_

## The crying colleague

I know exactly what episode the remark refers to, but I'm puzzled - the interpretation that I caused the episode or even the implication that someone was mistreated or offended is off.

I remind my own _Test & DevOps_ colleague the situation that occurred:

The development team had a planned workshop, even my colleague now sitting in front of me was supposed to attend, but called in with child sick on the day. The planned and prepared agenda of the meeting was on the very specific topic of mono-repos vs individual repos in git. The cause was that we had instructed and chosen tha path for the team that we used a multi-repo approach with detached and _individually releasable_ git repositories for _back-end_ and _front-end_ respectively. The team was distressed and frustrated, they felt that this decisions caused some extra complexity when starting up devcontainers, handling service connections between separate containers, maintaining dependencies on Semantic Version labels, setting up pipelines etc. The team's position was united, they were already under pressure from deadlines and found that they wasted time on infrastructure, They demanded that we should transition to to a mono-repo design. The team came well-prepared with examples well-know mono-repo implementations.

Despite the lengthy discussion, the outcome was that I insisted that we stayed in our current setup and that we would not migrate to a mono-repo approach. I've specialized in Version Control and Configuration Management for 25 years, my arguments were solid too. A mono-repo wouldn't solve the underlying complexity, but perhaps conceal it for a time. It wasn't worth the effort.

Then we went to lunch.

We noticed that one of our colleagues were missing at the table, I went back to the workshop room to check on him. He had stayed behind, contemplating. I sat down with him, we talked. He was frustrated from the engaged and vivid discussion we had just had. I'm a FCL to this colleague myself, I know this person quite well. I had employed him as a senior developer with aspiration to become a team lead and I was mentoring in that role. He was frustrated. He felt he had lost the argument. In his frustration, during our talk — he shed a tear — he excused it to me. I comforted him and supported him that vivid and engaged discussions aren't bad, It's good to be passionate - even in discussions on git.

I went back to the lunch table, my colleagues following immediately after, still a bit red-eyed, but in good spirit.

_This_ was the episode, that my own Focus Contract Leader now laid as the compelling cause for firing me in an ambush teams-call with a completely different agenda. Without my employer — the top-dog partner in t&do — in the call, but with a substitute Implement partner to represents upper management.

I reminded my colleague that this episode was one that he and I had discussed internally in _my_ focus contract meetings with _him._ And I remended him that he had previously complimented me for handling the situation well, and that the person in question, who was now pictured as an offended party, after the episode had re-appointed _me_ as his continued FCL in the annual process where everyone is _free to choose their own leader_ as Implement poetically refers the the relationship between FCLs and _followers_.

Silence — no response.

Before the meeting ended I noted that I would like the given cause for my termination to be put explicitly in writing in my resignation papers. The Implement partner replied that it would of course be included; _"It's standard procedure"_.

Hang up.

In the seconds after the meeting I immediately reached out on Slack to the five people in which I'm FCl to. To notify them that we could continue contact on LinedIn chat. But that I would soon be unable to reach on Implement's internal infrastructure.

Out.

I haven't talked to anyone at partner level in neither t&do nor IM_ since then. Not a single word.

I reached out to Implement's _people_ department which is the term the HR department use internally, asking for an off-boarding or exit meeting. The message was that they don't offer this as standard, but if I insisted they would set one up. The meeting was scheduled to be two weeks out and it was even postponed once, before we actually had a had a 30 minute teams call with two representatives from _People_.

I spent the next three days in a traumatic shock, introvert and focused i was writing on a document summarizing the entire timeline since my first encounter with Implement an up until the traumatic ambush call.

## The Friday evening mail — Dear all…

I knew _exactly_ why I was fired, and I knew that it _wasn't_ for the cause that I was officially given in the meeting.

In the three days leading up to my termination, I had been in a mail dialog with the two partners in t&do. The mail thread started Friday evening when the top-dog partner sent out a mail to all employees in the hub. The content was in the line of the following:

In regret the partners have to inform that dire times are ahead; we haven't reached our target, we have consultants on the bench. Anyone who is currently on a billable project need to optimize the invoicing to the benefit of the common good of Test & DevOps and everyone not invoicing need to set up coffee-meetings with Implement partners and reach out to personal network to pick up _anything_ that can be invoiced, this is not the time to be picky. Working overtime may be called for by those fortunate enough to have billable work. All training and education activities will cease as per immediately and will — going forward — require explicit approval from one of the two partners. All hiring will cease too – for the foreseeable future. The cause for this is that the owners; Implement Consulting Group, as per immediately has changed the definition of all .ttc hubs from _startup_ to _scaleup_ this implies a gloves-off expectation regarding transferred dividend, the runways has ended. This also implies that the monthly head-count fee that the .ttc hubs pay to Implement to receive core functions will no longer be subsidized by Implement and will has been raised with 55% to a total of DKK 20.000 per employee per month.

The mail ends with an inspirational cheer; _"You are all fantastic, we will get through this together — I know we can!"_

At the time of the mail I hadn't talked shop with any of the two partners for three weeks. I was in the plane, coming home from a week of vacation in Naples when I read the mail.

In the week before that, both of the two partners had been off on vacation, simultaneously.

Ironically enough, in the week before that _all of Test & DevOps"_ had been on a well deserved celebration trip to Malaga. Celebrating that we're a fantastic team.

In my role as Group Lead for the software development team and in my capacity as FCL for half of them this caused concerns. The team had already worked overtime for the larger part of the past six months. And despite the intense workload, the team bonus two months earlier had only been a disappointing symbolic pay-out, nowhere near the anticipated; _an extra month's pay per year_.

The math behind of the Sunday evening mail would be that the hub would have raise the annual turnover with more than DKK 7.5M only to reach status quo — where we _didn't_ get our bonus. My take was that we _couldn't_ do that. I set the two partners a distressed reply mail - only to them, no one else was CC'ed or informed. But I aired my worries and concerns.

No reply

Monday was hard. The mail from the partners was not received well by the team. In the Monday morning meeting, which that partner elegantly declined, despite the fact that he _usually_ attends it was debated intensely. In my role as group lead I was confronted with many questions and distress signals. I had to reveal, that I had no more information than the team members themselves, but I promised I would address all questions to the partners.

I promised to address it. Monday I wrote a second follow-up reply to my still unanswered first reply. Explaining the push-back from the team and asking concrete questions about the future.

No reply

Tuesdays was just as bad. I was contacted directly by three of the people I was FCL for, with questions about the actual consequences contoured in the mail. The worry for the announced overtime, if the immediate stop for new employees included the ones that were currently part-time student worker and  due to become fulltime employees in the near future.

No reply – not directly. However, the partner I co-run the team with sent out and invite to the members of the software development team - in the week to follow, where people would be welcome to ask questions regarding the week-end mail - should they have any.

Wednesdays morning the partner I co-run the team with was finally present in the office space. I asked for some of his time. We sat down for the most of an hour - went over the concerns I had aired in the mails. He agreed that the math I had presented was right, the numbers weren't good. He felt that it was out of his hands to do anything. The message from the owners was clear. He revealed that the number is 15%; 15% of the turnover will unconditionally be allocated as divided to the owners. A possible bonus to employees will follow after than - if there's still a positive contribution margin.

Wednesday evening I'm back on the mail thread, still only with the two partners. I'm getting push back from the top-dog partner, he is not at all content with the anticipated work load we have logged in the capacity sheet - he is expecting each team member to invoice in the range of DKK 220K per months - I do the math. That's like 15% overtime required and all other activities except invoicing brought to a complete stop — even internal team meetings. On top of a half year gone by with constant overtime.

In this mail thread to the two partners, I made some concrete suggestions to become profitable and successful:

- Steer by _Contribution Margin_ as opposed to _Turn Over_ (both IM_ and .tcc are steering solely by turn-over KPIs).
- Do not uphold four individual core service offerings in a team of 30 people, if they are not profitable.
- Don't uphold an unconditional employment stop. Instead; continue to employ where we are busy and successful (the dev team) and drill down where we are not.
- Get you timing straight; Do not have your team work overtime for half a year, then deny the employees their anticipated _bonus_, then send the entire team to Spain for a _treat_ to _celebrate_ success — and then two weeks later define a _disaster_. You are sending mixed signals — they will call your bluff!
- Do not cancel or revoke people's planned training, education, internal meetings and social events – The corporate standard defines full billable capacity as ~115 hrs/month — the number stays the same even during a crisis.
- When people are employed with no upper work limit, you do not exploit that to ask people to work overtime over longer periods – the corporate guide line is two weeks. _Unforeseeable future_ is a mighty long time and simply too much of an ask.
- Restrain from seagull-management (fly in - shit - fly out) — Do not simply pledge people to be self-managed during a crises — some some true leadership, own the direction.
- Do not accept a strategic price reduction to the customer (the entire team worked full time for 1 1/2 month with no invoicing at all) just to mend a dogy relation with an internal senior partner, at the expense of knowingly sacrificing the overall team KPI but with the imagined gain that you can keep this customer forever. While you inform the team that _"All is good — we can safely make that investment"_ and then pull back when you realized that the investment wasn't cleared with the owners – you lied!

Well - as expected — then I was let go - effective immediately!

From zero to out was four days. In then period I sent four applications to new jobs!

---
