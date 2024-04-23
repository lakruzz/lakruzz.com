---
title:      Summary
caption:    Read this if you don't have time to read the entire report
weight:     30
web-report: true
published:  true
---

In general we were quite impressed with your enthusiasm and commitment at Universal Robots. 
Such level of engagement is a rare sight, and it's obvious to us that you take pride in your craft. 

We found that you have a very high level of technical proficiency and continuously challenge each other, but do so in a very respectful and professional manner. Although it's quite a challenge running so many workshops in such a short time span, this made running them with you very enjoyable and fruitful.

Some of the things you showcased during the workshops were also rather impressive. The fact that you have implemented quite a battery of automation and improvements as part of everyday work, also shows us that this is something you care for.

In the next chapter, we will go into detail on every observation we've made and noted. As not all of you will want to read the entire report cover to cover, this summary is presented as a narrative compilation of recommendations that scored a clean _Must Have_.


## Culture and Organization

Some of your highly engaged teams have already identified many improvements and areas of technical debt. You've already got the mindset for the task and had already identified many of the common issues we usually encounter during these workshops. _"It's like an aircraft engine. You need to do the maintenance to keep it in the air"_ was an apt analogy you brought up. This is a great start, you understand the need to continuously take care of your asset.  

However, your current approach was also described as an ad-hoc _"boy scout"_ approach. Meaning you do the right thing by making improvements as you identify them. It creates hidden effort and can actually create more debt than it fixes. 
The approach to maintaining your asset needs to go to the shop, it needs to be analysed and planned. Create them as issues in Jira, theme them, **commit** to doing them as part of your sprints and measure your progress. You have technical leads for the main subsystems. They should be driving this in a planned and organized manner.

There is also a certain level of acceptance towards manual testing from a cultural perspective. This means that tacking quality on is, to a degree, accepted. We think you should start with promoting testing to a first class citizen in the development process.
There will always be some form of manual validation, but you want to ingrain testing as an _automated_ process into your culture, as manual testing is inefficient. You can only do this if you implement some form of test management and define a strategy that will enable effective, flexible and scalable tests. This test strategy needs to be embedded into your culture and organization. 

Code reviews should **not** be used for verification and should only be done after all automated verification has run. The best code reviews are those that check code semantics, often involving people with specific domain knowledge. Consider if pair programming is an option, which can be easily planned up front and helps creating cross-functional teams.

The last thing we'd like to highlight is the existence of team subcultures. Some of it may be domain pride, which is quite okay, but it seems to be partially driven misaligned processes across the teams, causing friction. Your branching strategies are a good example of this. How you develop software affects how you interact with each other. Aligning your important processes, like branching, versioning and test approach will give you a lot of value. At the end of the day you are delivering _one product_ to the customer.


## Tests

First and foremost, you need to get your tests under control. As it stands, they are really slowing you down and causing unwanted side effects such as long feedback loops, unstable pipelines, etc. The result is that the value of your pipelines are degrading, eventually leading to red builds being ignored.

We suggest you start by stabilizing the automated tests you already have. Valuable tests need to be fixed, while redundant tests need to be removed. 

Focus on defining and implementing a test strategy and building up an inventory of tests. Follow best practice as far as the test pyramid goes. Rotating your pyramid 90° clockwise will give you a solid idea of when to run which tests in your pipeline. 

Currently, your functional tests, also referred to as E2E, are being executed prior to the aggregated UR upgrade package. This is what you actually want to run such a high level of tests on. As functional tests are inherently more complex, they also affect the feedback loop, so run them after the first level of feedback is given to developers. In addition, consider running the tests in parallel where possible. 

## Version Control System

You need to move to Git. Subversion is simply too bulky and inflexible for a real CI/CD approach. It doesn't do branching and merging very well, which you will be doing _a lot_ in an automated release train workflow.

This is one thing we really feel you should focus on. You need to start defining your migration strategy. 

You also need a defined branching strategy that supports a CI/CD and release train approach. This branching strategy should be the same across all the teams. This will enable automation and CI/CD by doing automated verification as a toll gate for entering the integration (main) branch. You want logical commits, which are automatically verified on branches and automatically merged into the integration branch.

## Architecture

Large monolithic code bases, which take a long time to build and validate do not play well with CI/CD, regardless of the VCS or branching strategy chosen. A lot of the perceived problems are rooted in this: the complex build system, implicit dependencies, slow builds, etc. This is by far your biggest and most daunting task, but it is the one that will give the most value. We're pretty sure we are preaching to the choir here. You want a more modular, loosely architecture. 

PolyScope has some monolithic tendencies. Notable, there's a single JAR that's composed of 80% of the PolyScope code. You should investigate a more modular approach.  

There is a tight coupling between PolyScope and the Controller. This can be loosened by splitting the dependency out into its own versioned and controlled artifact. An added benefit is that you'll be able to manage the public API explicitly.

Breaking down your architecture into modules and creating individual pipelines for them implies you'll need a structured and cohesive approach to dependency management and releases. Though we sadly didn't have the time to dig deeply into this area, we know you are aggregating your dependencies in the firmware subsystem and the UR upgrade package. This means that you are _already_ doing dependency management, you just need to make sure it is a cohesive approach where you can automate the creation of a versioned release from a branch and identify the dependency from the version. This is what the version, release and branching strategies will give you. The ability to automate the process.

## Builds

One of your biggest pains right now is your unstable integration branch (trunk). 
The main drivers behind this are the lack of a cohesive branching strategy, unreliable tests and the absence of an automated toll gate.
Start by setting up a toll gate to your integration branch.
Define what makes code _good enough_ to share with colleagues, e.g. can compile and run unit tests, and set this up as a barrier into the mainline.  
Once development is done solely on topic branches and the automated toll gate is the only way into the mainline, you will have a stable trunk.

The build script looks to be a point of friction as it's an attempt to combine some of the subsystem builds due to dependencies. 
The shell script is a pre-step, followed by Maven and SCons to build the subsystems. 
This is in reality just a reaction to the coupling between PolyScope and the Controller. 
The result is a slow feedback loop. This pre-step should be handled as a _dependency_ instead of a _build requirement_, so you won't have to build needlessly.

At least once, during the workshop, it was stated that not all of the build setup was found in scripts, but it was located _somewhere_ in Jenkins. 
We have extrapolated this to mean the pipeline definitions. Your pipeline definitions are separate from the code. 
As a result, it is difficult for developers to get an overview of what they need to control.
You need to build a better separation of concerns here.
The DevOps team should provide the pipeline framework while the domain specific configuration should live in the repositories. 
The developers should be able to control what to build, which suite of tests to execute, etc. while the framework should just ensure that the definition of done **is** executed. 

You need to push your pipeline into _Front Office_. 
The tests that are being done, or triggered manually, on the UR upgrade package should be part of a pipeline and the final image given to the customer needs to be generated as well. 
In reality your final automated tests should be done on the _generated_ image. 
In general there are too many manual steps in the *Front End* release process. 
You should focus on automating these to the extent possible. 

## DevOps

It is quite evident that this has been an area of focus, a lot of work has been put into it and quite a lot of benefits have already been reaped. 
However, you have a low _bus factor_ here. Therefore we would recommend that some effort be put into opening up the *information bottleneck*. 
DevOps, obviously, wants and needs a certain amount of control. But there is a fine balance between control and flexibility. 

There are a couple of findings that have to do with resource management, both hardware and human resources. 
We recommend you take a closer look at how you manage both of these. 
Ask yourself what the best strategy for scalability from a hardware perspective is. 
Is it really fewer, more powerful, machines, or does the problem lay somewhere else? 
The one Windows build machine is an obvious bottleneck but you should make sure you identify the core problem. 

Should the DevOps team really be maintaining the Jira and Confluence instances? 
We recommend that you shift such tasks away from the DevOps team and have them focus on feedback times, pipeline structure, automation, access to **more** production like environments, etc. 
The DevOps team should still own the _'how'_, i.e. the process flows, but shouldn't have to deal with the installations.

Get the last pieces in place as far as your present infrastructure is concerned. 
You're utilizing Docker images, which is great. Many organizations are far from containerization. 
But the base images are being built constantly. This means that they _could_ move under your feet. 
Consider bringing Docker Registry into the picture. 

Your environments should be managed as code. 
Start to make this a reality with a CMS like Ansible, Chef, Puppet, or whichever you choose. 
Use these _clean_ environments as much as possible. Why could they not be the basis for developers environments?

### A high level road map

For a high level road map of our recommendations, we'd suggest the following:

1. Move to Git and start using a branching strategy that supports a release train workflow.
2. Define and implement your toll gate into the integration branch.
3. Stabilize your integration branch and react when it goes unstable.
4. Define and implement your test strategy.
5. Start chewing away at that elephant! Break the monolith down with an iterative approach. It's too big to eat in one sitting.
6. Automate *Front Office*'s manual processes and put them into a pipeline.
