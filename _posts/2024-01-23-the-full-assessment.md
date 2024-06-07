---
title:  "The Full Assessment"
excerpt: Continuous Delivery is to software development what lean is to manufacturing. We strive for Lean Software Development. A one-piece flow with quality built-in.
last_modified_at: 2024-06-06
search: true
author: Lars Kruse
author_profile: false
header:
  teaser: /assets/images/pics/ws-0025.jpg

valuestream:
  - url: &img3 /assets/images/pics/ws-0003.jpg
    image_path: *img3
    alt: "placeholder image 3"
    title: "Everyone is contributing to the Value Stream Mapping process"
  - url: &img2 /assets/images/pics/ws-0002.jpg
    image_path: *img2
    alt: "placeholder image 2"
    title: "Image 2 title caption"
  - url: &img10 /assets/images/pics/ws-0010.jpg
    image_path: *img10
    alt: "placeholder image 10"
    title: "Image 10 title caption"  
  - url: &img11 /assets/images/pics/ws-0011.jpg
    image_path: *img11
    alt: "placeholder image 11"
    title: "Image 11 title caption"  
  - url: &img18 /assets/images/pics/ws-0018.jpg
    image_path: *img18
    alt: "placeholder image 18"
    title: "Image 18 title caption"  
  - url: &img23 /assets/images/pics/ws-0023.jpg
    image_path: *img23
    alt: "placeholder image 23"
    title: "Image 23 title caption"  
  - url: &img24 /assets/images/pics/ws-0024.jpg
    image_path: *img24
    alt: "placeholder image 24"
    title: "Image 24 title caption"  

boards:
  - url: &img7 /assets/images/pics/ws-0007.jpg
    image_path: *img7
    alt: "placeholder image 7"
    title: "Image 7 title caption"       
  - url: &img22 /assets/images/pics/ws-0022.png
    image_path: *img22
    alt: "placeholder image 22"
    title: "Image 22 title caption"  
  - url: &img19 /assets/images/pics/ws-0019.jpg
    image_path: *img19
    alt: "placeholder image 19"
    title: "Image 19 title caption"  
  - url: &img20 /assets/images/pics/ws-0020.jpg
    image_path: *img20
    alt: "placeholder image 20"
    title: "Image 20 title caption"  
  - url: &img21 /assets/images/pics/ws-0021.jpg
    image_path: *img21
    alt: "placeholder image 21"
    title: "Image 21 title caption"  
  - url: &img15 /assets/images/pics/ws-0015.jpg
    image_path: *img15
    alt: "placeholder image 15"
    title: "Image 15 title caption"     

fullpicture:
  - url: &img25 /assets/images/pics/ws-0025.jpg
    image_path: *img25
    alt: "placeholder image 25"
    title: "Image 25 title caption"  
  - url: &img4 /assets/images/pics/ws-0004.jpg
    image_path: *img4
    alt: "placeholder image 4"
    title: "Image 4 title caption"       
  - url: &img26 /assets/images/pics/ws-0026.jpg
    image_path: *img26
    alt: "placeholder image 26"
    title: "Image 26 title caption"  
  - url: &img16 /assets/images/pics/ws-0016.jpg
    image_path: *img16
    alt: "placeholder image 16"
    title: "Image 16 title caption"  


score:
  - url: &img1 /assets/images/pics/ws-0001.jpg
    image_path: *img1
    alt: "placeholder image 1"
    title: "Image 1 title caption"
  - url: &img5 /assets/images/pics/ws-0005.jpg
    image_path: *img5
    alt: "placeholder image 5"
    title: "Image 5 title caption"       
  - url: &img6 /assets/images/pics/ws-0006.jpg
    image_path: *img6
    alt: "placeholder image 6"
    title: "Image 6 title caption"       
  - url: &img9 /assets/images/pics/ws-0009.jpg
    image_path: *img9
    alt: "placeholder image 9"
    title: "Image 9 title caption"  
  - url: &img12 /assets/images/pics/ws-0012.jpg
    image_path: *img12
    alt: "placeholder image 12"
    title: "Image 12 title caption"  
  - url: &img13 /assets/images/pics/ws-0013.jpg
    image_path: *img13
    alt: "placeholder image 13"
    title: "Image 13 title caption"  
  - url: &img14 /assets/images/pics/ws-0014.jpg
    image_path: *img14
    alt: "placeholder image 14"
    title: "Image 14 title caption"  
 
---


This model [originates](/about-model) from the time when I founded and operated Praqma. In this post, I'll describe how I conducted this Continuous Delivery Metric Assessment at more then 25 companies
{: .kicker}

The name and concept “Continuous Delivery” is a deliberate reference to a lean or TPS inspired approach often used in manufacturing which takes offset in a one-piece flow that strives for quality built into the product as opposed to glued on - after it’s done.

In the modern world of software development we use the concepts _Continuous Delivery_ and _DevOps_ to be the equivalents in software to what lean means to manufacturing.

We strive for Lean Software Development.

## Value Stream Mapping - the _as-is_ picture

In Lean manufacturing there is a strict focus on Product Lifecycle Management – in software our focus is on Software Development Lifecycle Management (SDLC).

As in lean, we investigate and assess three different core phenomena that jeopardize an ideal delivery value stream:

- **Muda**: Wastefulness – Things and processes that are excess, which don’t contribute to value.
- **Muri**: Unevenness – Inefficient coordination of _takt_ and workflows that build up stock or create wait-states.
- **Mura**: Overburdenness – bad utilization of resources, scope creep and poor prioritizations

Just as in a lean process we get the first impression of the current state from an engaging workshop exercise based on a Value Stream Mapping technique. We gather team members and stakeholders and facilitate them to draw a rich picture of the current (as-is) process. We mark the waste, the back-loops, the wait states, the excess manual processes, the communication conflicts etc.

The Value Stream Mapping exercise's overall purpose is to understand current workflow and most importantly map lead times. We map the DORA metrics; Deployment Frequency, Mean Lead Time for Changes, Mean Time to Recovery, Change Failure Rate and reliability.

I've gathered a handful af pictures from some of the workshops and the first pile is from the initial part of the session where we do a Value Stream Map. It's a _rich picture_ we draw on the wall, everyone involved in the process has a pen, and we're mapping what exactly goes on while the software is produced, validated and shipped.

{% include gallery id="valuestream" caption="The workshop starts with mapping out the Value Stream of the product as _rich pictures_ laid our on the walls" %}

When the Value Stream begins to take form we introduce the _trouble markers_ which the participants use to mark where the process needs to be optimization in six different categories of troubles:

- **Manual Work** - dull, repetitive work done my humans
- **Queues** - processes where _takt_ is off due to lack of resources
- **Wait states** - processes where flow is broken - often during handovers. Tasks are dropped between chairs. What is important to someone is unimportant to someone else
- **Conflicts** - parties fighting each other, serving different and contradicting agendas
- **Unplanned work** - prioritization and systemic approach is soo poorly adapted, that plans fall apart all the time. It's fire fighting
- **Needs repair** - Processes are adapted to a certain situation, but the world has moved on. These processes needs to be updated

## Some board examples

{% include gallery id="boards" caption="The mappings show the troubles in the process and and all the painful back-loops" %}

When the Value stream is mapped and assessed we ask the team to prepare a walk-through of what goes on in the board. One person will start in the upper left corner and explain all the processes, troubles, connection, and back-loops.

It's very seldom that there exists such _one_ person that has the full overview of the entire process. During the walk-through new team members will have to take over. Most often _no one_ grasps the full picture.

{% include gallery id="fullpicture" caption="The mappings show the troubles in the process and and all the painful back-loops" %}

## The Goal - get the full picture – where we’re headed?

The Dreyfus brothers published a model for skill acquisition which contributed to the field of Cognitive Science as early as in the 80’s to propose an early model for understanding intelligence and expertise.  This has inspired us to build a model, not necessarily – just – for maturity, but also for in-depth metrics.

In Continuous Delivery in context of software development we focus on different areas of knowledge or matter; Build, Test, Version control, DevOps, Architecture & Design and Organization & Culture. These areas can be molded and adapted to the individual client and assessment.

After the Value Stream mapping session we present [the model](/) and ask the team to score each card from a miraculous point of view:

>_Imagine that the principle described on the card was fully implemented in your process. How much would it affect [throughput, feedback and payback](/gauges/) — and how complex would the implementation be_

The model suggests different approaches, techniques, tools or principles, which represent different levels of expertise and proficiency. We use the model to conduct a facilitated discussion with the team and stakeholders. Through this workshop we will debate every single card and assess how relevant this capability is in context of the quality of the product and the Software Development Lifecycle.

So we spread out in smaller teams and each team picks up a couple of cards of their own choice. Each card is scored for effect and cost of implementation. The processes continues until all cards are scored and assessed. The team must agree and debate the scores to get to some level on consensus.

## Scoring the cards in the model

{% include gallery id="score" caption="The workshop starts with mapping out the Value Stream of the product" %}

This concludes the first day of the Value Steam Mapping - and Card scoring workshops.

## Observations – digging in the dirt

Next stage is to get our fingers into the dirt and have various team members explain and demonstrate some of the tools and processes that we identify as a special point of interest. These sessions will be scheduled when we have the overview established from the initial workshops, so we can say for sure what these points of special interests are but typically we would do a combination of code inspections, static analysis, review tool utilizations, and we will study and observe the team’s common ways of working, branching strategies, deliveries, deploys, monitoring etc.

## Lean Coffee Workshops

To prepare ourselves to go into solution mode and enable us to suggest a feasible and realistic roadmap towards the end goal we will organize a series of “lean coffee workshop” - typically one in each area in the model – and whatever else is needed. In these workshops we will invite team members and stakeholders with special expertise in the field.

A lean coffee workshop is a special workshop format that allows participants to help build that agenda of the workshop dynamically in such a way that dire problems or issues take higher priority. For each discussion topic we will facilitate that we capture:

- The root cause problem
- A possible (maybe more) solution to mitigate it
- The value each identified solution would yield to SDLC or product quality

The findings are then recorded and presented as a detailed and customized note on each card - see card ["Automated Builds"](/automated-builds/) as an example (these are real finding from some of the assessments, but anonymized and used here to serve as examples). Also notice on the ["Automated Builds"](/automated-builds/) card, that the scoring from the workshop is captured. The score is 7 and [complexity is categorized](/gauges/) as _a group effort_.

## The report

This concludes our onsite effort – from here we will take the elicited intelligence home to discuss internally among ourselves and we will write up a report and propose a prioritized list of all findings in. It’s a quite comprehensive report that can serve as a roadmap or backlog for the work ahead.

The report will include an executive summary.

If you are interested the model score, the findings and the prioritized recommendations can be delivered to you as a static website; your one version of the website that your're currently at, which you can host securely on your own corporate inside – for every stakeholder to browse and reference.

This framework and model are inspired by lean principles, cognitive science, DORA metrics and DevOps and agile culture. Lars Kruse has been the lead on the development of this model and approach and has conducted more then 25 assessments based on this framework including:

Grundfos, Danfoss, Universal Robots, Volvo, Terma, Brüel & Kjær Sound & Vibration, Atmel (now Microchip), ATP, Alm. Brand, 3Shape, TetraPak, Novelda, Yxlon International, Oticon, Kamstrup, Napatech, Schneider Electrics, Schlumberger, Cryptera, DR, BK Ultrasound.
{: .kicker}
