---
# cSpell:ignore opsy businesscase

title:  "State of Devops — 2024"
excerpt: "Since DevOps was born we've had git, pipelines, containers, serverless infrastructure, social coding and AI. Where does that leave DevOps today?🤷‍♀️"
search: true
author: Lars Kruse
author_profile: true
hidden: false
published: true
categories: 
  - Test & DevOps
tags:
  - DevOps
  - DevX
header:
  teaser: /assets/images/posts/dora2024/dora-2024-1x1.png
basics:
  - url: /assets/images/posts/dora2024/dora-metrics.png
    image_path: /assets/images/posts/dora2024/dora-metrics.png
    alt: "DORA metrics"
    title: "Before we dive into this year's finding, Let's recap the four DORA metrics, developed over a decade. They anchor DevOps' close relation to lean principles and Continuous Delivery. The four metrics are the gauges we use to measure how much <em>waste</em> we have in our software development value stream"
  - url: /assets/images/posts/dora2024/dora-rework-rate.png
    image_path: /assets/images/posts/dora2024/dora-rework-rate.png
    alt: "The Rework rate"
    title: "The four metrics have been rock-solid for a long time. Any GPT can list them as gospel. And yet; this year an interesting outlier <em>Rework rate</em> has been added as an underlying (co-)factor for <em>stability</em> together with the change failure rate. The three others influence <em>throughput</em>"
  - url: /assets/images/posts/dora2024/dora-levels.png
    image_path: /assets/images/posts/dora2024/dora-levels.png
    alt: "The four levels"
    title: "Based on the respondents performance in the four original metrics they are categorized into four performance levels — roughly equal in size: <em>Elite performance</em>, <em>High performance</em>,<em>Medium performance</em> and <em>Low performance</em>"
  - url: /assets/images/posts/dora2024/dora-performance.png
    image_path: /assets/images/posts/dora2024/dora-performance.png
    alt: "How am I Doing?"
    title: "'How am I doing? What performance level am I at?' In this graph you see the actual numbers that defines each level. You can plot your own profile in here. Worth noticing: High performers have way higher change failure rate than medium performers and same fail deployment recovery rate. And yet they are high performers. Lesson; Throughput beats stability ('You miss 100% of the shots you don't take')"
  - url: /assets/images/posts/dora2024/dora-businesscase.png
    image_path: /assets/images/posts/dora2024/dora-businesscase.png
    alt: "Why should I improve?"
    title: "'What is the business case for DevOps?' All though these numbers don't give any specific references to money spent, it's not hard to imagine the power of being able to come up with an idea and develop it flawlessly and release it — and even retract it if it wasn't really needed, all in a matter of days - as opposed to not being able to complete the same cycle in a full year. 'Ouch - that gotta hurt'"    
ai:
  - url: /assets/images/posts/dora2024/dora-ai-adoption.png
    image_path: /assets/images/posts/dora2024/dora-ai-adoption.png
    alt: "AI Adoption"
    title: "First lump of data is not strictly related to DevOps, bust says something about the software developers <em>perceived</em> shift in focus towards incorporating AI in the process 81% see some level of increase and 49% even a 'moderate' or 'significant' change. With GPTs only being publicly and general available i about two years, the speed of the adoption af AI is - in lack of a better term 'mind blowing'."    
  - url: /assets/images/posts/dora2024/dora-ai-usage.png
    image_path: /assets/images/posts/dora2024/dora-ai-usage.png
    alt: "AI usage"
    title: "So what is AI used for? Well apparently they keyword is 'prompt engineering' Software developers are no-longer alone in their coding effort, they now rely on 'co-pilots' a term originally adapted from paired programming, but also – for the same reason – the name used for GitHub's IDE embedded GPT release June 2022. What we also see is that data scientists and Machine Learning specialists are using AI more than any other roles. But full-stack developers, security professionals and sysadmins are the ones reporting the largest productivity improvements."
  - url: /assets/images/posts/dora2024/dora-ai-individual.png
    image_path: /assets/images/posts/dora2024/dora-ai-individual.png
    alt: "AI individual effect"
    title: "At the individual level DORA if measuring on different impacts on success and well-being. It's interesting to see that AI generally have a positive impact. However, as AI usage increases, the time doing valuable work decreases. The paradox hypothesis being that AI has the most impact on productivity and producing value, but not as much on time spent on 'waste'."
  - url: /assets/images/posts/dora2024/dora-ai-organization.png
    image_path: /assets/images/posts/dora2024/dora-ai-organization.png
    alt: "AI organization effect"
    title: "At the organizational level. AI paints a pretty picture. With the effect on document quality being quite pleasantly surprising outlier."
contemporary:
  - url: /assets/images/posts/dora2024/dora-pe.png
    image_path: /assets/images/posts/dora2024/dora-pe.png
    alt: "Platform Engineering"
    title: "PE is a broad term. DORA describes it as 'Platform engineering is a sociotechnical discipline where engineers focus on the intersection of social interactions between different teams and the technical aspects of automation, self-service, and repeatability of processes.' PE is an important driver, for concepts such as DevX and Internal Development Platform. Numbers on efficiency fluctuate, based on specifics such as wether or not it's a truly self-service platform indicating and wether or not it includes <em>all</em> aspects of the SDLC or only parts of it."  
  - url: /assets/images/posts/dora2024/dora-devx.png
    image_path: /assets/images/posts/dora2024/dora-devx.png
    alt: "Developer Experience"
    title: "The new kid on the experience design block: 'Developer Experience' is founded on the observation that designing the experience of being a developer in you organization can greatly optimize both your process and the quality of the product. Parameters such as having influence on the tech stack used, access to useful documentation, being surrounded by competent colleagues, working close and in short feedback loops with end-users, being led, rather than managed seem to have bigger impact than almost anything else."   
  - url: /assets/images/posts/dora2024/dora-leadership.png
    image_path: /assets/images/posts/dora2024/dora-leadership.png
    alt: "Transformational Leadership"
    title: "Transformational Leadership as a mean to stimulate DevX. It operates on five dimensions and it turns out that it is probably the most significant performance booster. Not just for the individual employee and perceived job satisfaction but at every level; team, product organization. Back in the days, when DevOps was young we used to say something like 'DevOps is not a team, it's a mindset — it's a culture'. Well here's a slide that re-introduces that perspective."      
---

![image-center]({{page.header.teaser}}){: .align-center width="50%"}

{{page.excerpt}}
{: .kicker }

## Our DORA — not theirs

When using the phrase _"State of DevOps"_ I'm are of course referring to DORA.

But even though the EU Digital Operational Resilience Act is getting a lot of attention these days. It’s not the DORA I'm referring to. In the DevOps community and culture, we have known DORA for exactly 10 years now — as something else.

_**Ours:**_ DevOps Research and Assessment Institute (DORA)<br/>
_**Theirs:**_ Digital Operational Resilience Act (DORA)

Since 2014 The DevOps Research and Assessment institute (DORA) has released their annual report on “State of DevOps”. The report is based on replies from more than 39K respondents, all of which are professionals working in software. The report is essentially a scavenger hunt in all this data. Looking for insights and trends and based on correlations in data the report setup hypotheses, triangulated with qualitative interviews, for what is happening in the world right now — The World of DevOps at least.

This year's [report][report]{: target="_blank"} is 120 pages. Perhaps a bit much for most. But I'm a DevOps nerds, so each year I wait — full of suspense — for the report to be released in late october. So of course I read it. And this article is where I'll give you a curated highlight of the most interesting highlights.

## DORA basics

I have build and complied a deck of one-pagers explaining the DORA basics for newcomers. If you — like us — sit up and wait for the release of the report, then this 1<sup>st</sup> is probably too basic for you. If that's the case, skip it and  fast forward onto this year's report findings.

{% include gallery id="basics" caption="1<sup>st</sup> deck: DORA Basics" %}

## Contemporary DevOps — 2024

**Spoiler alert:** Before we dive into the deck revealing the finer details of the anniversary report's findings I'll lay it out plainly: The — by far — hottest DevOps buzzwords in 2024 are _still:_

- **PE**: Platform Engineering
- **DevX**: Developer Experience
- **IDP**: Internal Development Platform

If any of these concepts are not yet part of your team's daily vocabulary — then rest assured that before next years report they will be. Or learn to live with the fact that...

> "the future is already here – it's just not evenly distributed"[^gibson]

[^gibson]: _Quote: William Gibson, Sci-fi writer and essayist._

### AI adoption and impact

But the report's most jaw dropping claims are in the realm of AI. The speed of its adoption in software development and it's impact on factors as far apart as _job satisfaction_, _review processes_ and _code quality_. But also it's apparently negative impact on _software delivery performance_.

{% include gallery id="ai" caption="2<sup>nd</sup> deck: DORA's AI findings 2024" %}

### IDP, DevX, PE,  ...and all that jazz

DORA refers [another survey][meaningful] revealing that on average, respondents were willing to relinquish 23% of their entire future earnings if it meant they could have a job that was always meaningful.

DORA also references the [2023 Developer Survey][stackoverflow] done by Stack Overflow. In that survey over 90,000 developers responded to the annual survey about how they learn and level up, which tools they're using, and which ones they want. It's a different report entirely and worth a separate details look but from the perspective of DevX - Designing the Developer Experience, it's another cornucopia of information

{% include gallery id="contemporary" caption="3<sup>rd</sup> deck: DORA's buzzes 2024" %}

## How is all of this useful?

![Business case for DevOps](/assets/images/posts/dora2024/dora-businesscase.png){: .align-center}

Recall the Elite performers vs. Low performers comparison?

Software is such a costly endeavor that any improvement you make in the Software Development Lifecycle that will improve either throughput, feedback from end-users, stability, overall quality or just fewer reworkings on the code base will become a huge financial gain. And in the same process keep your developers more likely to not jump ship, but rather stay employed with you.

### Imagine

A process where a developer can not finish a task until a colleague has found the time to stop whatever they are doing themselves and then read through every line af code change and act as an — often arbitrary – quality gate of some change that no end-user ever requested, but some product owner insist is urgent. So urgent that it is added on top of all other work and demand it finished, even at the expense of overtime. So that it can become part of the manual test that is run 2 months prior to a planned release.

Imagine the developers mood when she, 3 months later receives a test failure report from the User Acceptance Test, saying the code is wrong, the feature is misunderstood and now starts a new similar cycle.

This could be a relatively typical low performer workflow.

### Compared this to

A process of one of the elite performers, where the developers always work in pairs, and always in close collaboration with the end-users, where they have unlimited access to production-like environments and therefore have the power of doing functional end-to-end tests automatically and herby guarantee that quality is always build in.

They work by a playful trial and error process until the end-user smiles and cries _"Yes - I love it!"_. Then the code is populated through an automated pipeline which verifies the quality and it is automatically released into production, maybe as a canary deploy to only a subset of users, or perhaps with a feature toggle making it available only to a specific customer segment.

Over the next couple of days data is collected on how the features is being used, and experiments are done on making it available to more and more users either by volume or segments.

In the meantime the developers and end-users are already onto the next exciting experiment.

A scavenger hunt for that desired end-user cry out. "Yes - I love it!"

:heart:

If you are in any need of inspiration or practical help with beefing up your SDLC with some _DevX_, _IDP_, _PE_, _AI_, _Prompt engineering_ initiatives - or any other good old DevOpsy concepts such as _containerization_, _Infrastructure as Code_, _declarative pipelines_, _Semantic Versioning_ or the like. Then feel free to call upon us and invite os for a coffee and an inspirational insight into what contemporary Devops can do for you!
{: .kicker}

[report]: /assets/pdf/2024_final_dora_report.pdf "2024 State of DevOps Report"
[meaningful]: https://hbr.org/2018/11/9-out-of-10-people-are-willing-to-earn-less-money-to-do-more-meaningful-work "9 Out of 10 People Are Willing to Earn Less Money to Do More-Meaningful Work"
[stackoverflow]: https://survey.stackoverflow.co/2023/#technology "90K+ developers responded to how they learn and level up, which tools they're using, and which ones they want"
