---
---

### No defined branching strategy

You currently lack a common branching strategy. 
Some teams work using topic branches while other do trunk based development or take another approach.

#### Define a strategy with a release train as goal (S)

If you are Agile, or profess to be, then you are using a branching strategy that is geared towards a release train. 
This means a branching strategy with **one** long lived branch.

#### Each commit is a release candidate (M)

Verify each commit individually and promote it as it passes through your pipeline. 
Whether or not this commit will actually be the next release is irrelevant.

#### Define when to branch (M)

Utilize feature branches for development. 
Use **late branching**, branch off to work on a single feature, and only work on features going into the next release.

Define who, how and when you branch off for maintenance, if at all.
Determine which of your current maintenance branches you want to keep and for how long, remove the rest.
When creating maintenance branches, do so as late as possible.

#### Institute the same branching strategy across all teams (M)

The teams must use the same branching strategy. 
Not doing so creates confusion, conflicts and makes cross-functional teams difficult to realize.
It also makes consistent releases extremely difficult.

### Early branching model in action

You rely on an early branching model, which results in three long living branches, your trunk and two release branches.
Long lived branches are expensive to maintain and should be minimized or, preferably, avoided entirely.

#### Implement late branching (M)

Rather than branching as early as possible, it's advised to branch as _late_ as possible.
Your goal is to be releasing from the mainline, not from release branches that underwent stabilization.
You want to _continuously_ stabilize your mainline.
