---
---

### Team subcultures make collaboration challenging

The teams aren't aligned in how they are developing software. 
This makes it difficult, if not impossible, to optimize and automate the processes.

As evident from the workshops, it can lead to conflict and friction between teams as well. 
We overheard statements such as "Well, that is not how we do it". 
Often parties simply agreed to disagree.

This makes it difficult for members in cross-functional teams that are working across the different subsystems, but towards the same goal.
It fragments the *way of working*, alienates newcomers and makes it near impossible to support from a DevOps's perspective.

One example is how code reviews are conducted throughout the code base. 
Some are doing reviews on branches before merging to trunk, while others reviews at the desk before committing or even considering using Crucible or FishEye.

#### Align processes across teams (M)

The teams must standardize and align their processes.
Your strategies for branching, testing, reviewing, etc. should be similar for each team.
The underlying technology may differ, but how you contribute to the mainline should not.

This allows developers to focus on individual implementations and greatly helps build cross-functional teams.

#### Deliberate communication between tech leads (S)

There are technical leads for the major subsystems and testing.
They should meet regularly to discuss approaches and align their teams.

### Code review blocks integration to trunk

Your code reviews can take one to two days. 
In the meantime, changes lie on hold on a developer's desk or rest on a separate branch somewhere. 
Different teams use different processes, so this could vary, but all of them are _not_ doing continuous integration!

Code reviews are a great practice, but can become serious blockers introducing queued and unplanned work if implemented poorly.

#### Validate last (S)

Validation, the process of determining value, is very expensive and requires human interaction. 
Do the validations **after** the verification has been automatically executed.
Code reviews are _validation_. 

#### Utilize tools for review collaboration (S)

Consider tools like Crucible, FishEye or Upsource to help do code reviews in a non-blocking manner, i.e. post-integration but pre-release reviews.

These tools are quite lean in usage and can help to remove the queued and unplanned work. 
They also integrate quite well with tools like Jira.

If you want to hold mandatory reviews or monitor your review rate, you should do it prior to releasing.
Here you can review at a high level for the things that matter most, the things that automatic verification can't handle.

#### Break down your Jira issues to tasks with agreed solutions (S)

Solution design should be part of task grooming and shouldn't be discussed afterwards, it should be done prior to start of the coding. 
Grooming errors involves a root cause analysis, followed by a proposed solution, agreed upon by the team members and architects.
Smaller and well defined tasks are far easier to review.

#### Do pair programming (C)

The best code reviews are the ones checking the semantics of the code, often involving people with specific domain knowledge. 
If you need to check the semantics of an implementation then the best way to do that is to program it _alongside_ the right person.
Pull in domain experts, testers or simply colleagues when implementing changes.
This will also greatly help in building cross-functional teams. 
