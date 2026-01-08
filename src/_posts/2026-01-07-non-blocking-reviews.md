---
title: Non-blocking reviews
author: Lars Kruse
search: true
author_profile: true
comments: true
header:
  teaser: /assets/images/posts/lakruzz.png
tags:
  - services
excerpt: Get the best from two worlds, replace your peer-reviews with shift-left and formal reviews to obtain high throughput and stability
# cspell:ignore 
---

![image-center]({{ page.header.teaser }}){: .align-center width="50%"}

In a Quality-by-Design paradigm there is a widespread misunderstanding that _peer-reviews_ are required to be compliant. The truth is that a _four-eye principle_ is required, and _formal reviews_ are too. But using _peer-reviews_ as a quality gate is not required and it  violates almost every lean principle we can think of. Read on to learn what to do about it.
{: .kicker }

## Why peer&#8209;reviews used as quality gates are an anti&#8209;pattern

To set the scene, let's imagine a team that strives for keeping the `main` branch as the only long-lived branch and maybe even in an _always-shippable_ state. To obtain this, each developer works on an issue branch and when ready to merge to `main` a Pull Request is created. The design and intent of the Pull Request is roughly as follows; a host of checks are run in the pipeline, their statuses are recorded on the PR and if the checks pass an additional manual review is required, often by an arbitrary peer, but it can also be requested by a named colleague, maybe a mentor or an expert.

Now the PR just sits there until someone has the time to review and merge. Time passes.

When the reviewer finally picks it up it there may be change requests, usually based on some variant of the reviewer's _opinions_.

Now the PR just sits there again waiting for the contributor to get back at it and pick it up again. Time passes.

When the required changes are finally committed the PR becomes active again, the pipeline run again, the status checks are recorded again and a new reviews is required.

For a while the PR just sits there. Time passes.

I you are unlucky, this cycle is repeated multiple times.

Sounds familiar so far?

### What's the problem

The value stream isn't optimized. There is far too much _idle time_ compared to _process time_.

**Unevenness** _(mura):_ The process is bumpy; The developer is busy half-finishing something, then either waits or picks up a new task that. In the mean time the reviewer is spoken for, but in the middle of something else. Even if the PR is just sitting there doing noting it feels like pressure, others are waiting. Maybe the reviewer chose to switch task and quickly rubber-stamps the PR approval.

**Overburdenness** _(muri):_ With all the work in progress and the task switching the cognitive load on team members is high, but still, with all the _idle time_ not much comes through creating a constant sense or urgency.

**Muda** _(wastefullness):_ Unfinished work is piling up — in the form of multiple PRs. Hand-overs and task-switching occur frequently. Feed-back loop is long since it includes all the _idle time_. The rubber-stamp approval degrades quality.

In a Quality-by-Design setup I've often heard that:

> _"Due to regulations, were required to work like this"_

In less strict setups where the QA process is self-inflicted I hear:

> _"We wouldn't survive without the reviews, that are the core of our quality assurance"_

Even in more unreflected team this is still the default, simply because it's what GitHub, GitLab, Bitbucket and Azure DevOps offers out of the box.

> _"We haven given it much thought, this is what it means to be a developer"_

In this post I want to explore an alternative approach.

## Shift-left

An important first step is to truly adhere to — and build — a one-piece-flow. This will get rid of the _unevenness_ which is often considered the root-cause to both _overburdenness_ and _wastefullness_.

A one-piece-flow is a lean concept that serves the purpose of making any potential errors, problems or defects emerge _immediately_ in the process, so they can be dealt with at the source.

Analyze what actually goes on in the review and then seek to automate that process and shift it left, so that the developer gets access to this feedback _while_ the work is being done - not after.

Build quality in.

The key concept to dwell with is _static code analysis_ simply because it executes fast, and in this part of the workflow — while the developer is hacking code, we need the feed-back loop to be extremely fast.

I  consider _unit tests_ to be included in the category _static code analysis_, but there are a few requirements to unit tests that has to be met for that to be true:

- All external dependencies must be mocked — no exceptions
- All test-data – or the script that synthesizes test-data — must be version controlled too

From here on you just turn on all the whistles and bells - for each single commit you run stuff like:

- Build (with cache)
- Unit test (with coverage)
- Linting (turn on all rules)
- Cyclomatic complexity check
- Spell check
- link proofing

This may not even be enough, think of the push back you could possibly get from the reviewer, anticipate it an mitigate it. And then implement it too.

## Andon cord

Set this up as a pipeline, that runs. Not just on the Pull Request, but every time you push your issue branch.

The point is to replace the peer-review-as-quality-gate setup.

Therefore this _first_ pipeline should work like the _andon cord_ in a lean manufacturing setup. The _andon cord_ is a line that run throughout the factory floor. When a defect is spotted, the andon cord is pulled the _entire_ process stops and only started up again when the defect is fixed. Effectively preventing any process from passing a defect on to another.

If _any_ of the static code analysis checks do not meet their threshold, then the commit can not be merged to `main` – but on the other hand, if all thresholds are met, then it can me merged to main - no questions asked, no review needed.

I usually also set this up as `pre-commit` git hooks in the repo. This way I don't have to suffer the time it takes for the pipeline to set up containers and start, and I can easily run the hook manually if I want to run the check without actually committing.

I recommend that you are careful in the way you design your checks. As an example, when working in GitHub I utilize as few Actions as possible, since they specifically only run in a GitHub workflow — not in my developer terminal. But using GitHub CLI extensions runs equally well in both contexts. Githooks are fast, and delicious, but its the workflows in the centralized pipeline the holds the truth.

E.g. a `pre-commit` hook can be circumvented with `--no-verify` on the git commit command. The Workflow on the other hand is merciless - it records the statuses that are required to merge to main.

## Pair up — collaborate

So committing straight to `main` with out a peer-review.

_— What! are you mad?"

This debate is old, it's the Trunk-Based evangelists being told that what they do is irresponsible. But here me out, we're not done yet.

In Quality-based-Design it a _requirement_ that the four-eye principle is followed. If that is the case, switching to a setup where the sign-off by two is done _during_ the development as a collaboration effort, as opposed to _after_ where it's more of a quality gate has some clear advantages.

It does not have to be a strict paired-programming setup with a driver and a navigator, sharing one keyboard, swapping every 20 minutes ...although that is actually both fun and efficient. It could just be that the developer grab colleague, and get some feed back - not a check, but a feed-back.

The developer signs the commits and the reviewer adds an annotated signed tag to the same commit. In less strict setups you can omit the GPG signing, but in a regulated environment, with GPG signing, you now have solid proof that two people signed off to each singe commit. Without creating _unevenness_ in the value stream.

## Review later

This is also where the non-blocking part kicks in. Because the formal review shall just happen before the release - not necessarily before a commit hits `main`. So leaving the verification to the static analysis setup in the one-piece-flow and having two responsible sign of before the review, is quite sufficient.

## Keeping `main` always-shippable

To understand this term _always-shippable_ it's important to get the nuances right.

shippable to _where_ and _who_

I advocate using semantic version labels to mark progress (and quality verification) until it can be released.

## Semantic Versioning

[semver.org](https://semver.org){: target="_blank" } defines:

```bash
<valid semver> ::= <version core>
                 | <version core> "-" <pre-release>
                 | <version core> "+" <build>
                 | <version core> "-" <pre-release> "+" <build>
<version core> ::= <major> "." <minor> "." <patch>
```

In plan language; a core version is defined by a three-level integer separated by dots. it can be suffixed with either a pre-release identifier or a build identifier - or both. If the build identifier is used it must come last.

SemVer doesn't give and specific rules that defines how these apply to your process or configuration management, but here's how it works in a QbD setup:

The code propagates through the _environments_ each environment level implies more strict validation of the quality and compliancy.

In a critical setup it is typical to have multiple environments like this:

**test**: New commits on `main` are automatically deployed to the _test_ environment. This environment is used to run more automated tests, but this time, _nothing_ is mocked, everything is _real_. So the entire infrastructure is intact with databases, live-feeds, integrations, API access etc. and tests here are instrumented to work as _end-to-end_. tests. They do not just massage the code, like the unit tests did, instead they mimic the behavior of the end-users, they serve as regression tests, but the deploy to this _test_ environment also serves the purpose of actually testing the deployment process itself.

Like the static code analysis before we entered main, this is also a threshold, is't still part of the one-piece-flow. if _anything_ goes wrong it't reported back to developers who fixes it. No defects can be passed on from here. If all is good the commit is automatically marked with a `core+prerelease+build` or `core+prerelease` semver tag.

**stage** new `core+prerelease` tags trigger a deployment to _stage_ the formal test is done, this is an environment dedicated to _validation_ rather than _verification_. this is where we engage with end user, where we execute User Acceptance Tests, if we must. The users never see error in the software. We're not testing if the software is working, but if it is specifically working as intended. The judgement wether to propagate or not is quite simple; If the users rater want this version, over the one that currently runs in productions then we forward, else we take their notes and go back to developments. If the version is propagated then it's marked with a new `core` semver tag.

**production** is not updated automatically, for safety and political reasons an update requires a conscious decision, but the _productions_ environments only accepts `core` semver versions.

## Kill the monolith

The complexity in a setup like this can admittedly be quite daunting. This is why we advocate to adhere to a divide and concur approach.

Following the _high cohesion & low coupling_ principle the code is organized in relatively small repos rater than just one big mono_repo. Each repo is seen as an individually releasable components. You know this concept well from all Open Source code modules. Every time you code runs an `import` you rely on an individually releasable component. With its' own set of features, backlog, roadmap, documentation, release notes, tests etc.

For a lot of the code we build it's more like playing with LEGO blocks or build IKEA furniture, we ar using components and parts that already have their own individual approval process.

Ideally we should deconstruct our own homegrown monolith into a similar pattern. So when a component is tested and validated and gets it's own `core` semver tag it is build and put to the package manager storage - and the only thing we shall do to get the new features is to `import` it and use it.

When working like this we get dependant on a _product manifest_
