---
title: Collaborative Agents
author: Lars Kruse
search: true
author_profile: true
comments: true
#last_modified_at: 2026-03-14
header:
  teaser: /assets/images/posts/cobot-agent.jpg
tags:
  - Agentic AI
excerpt: "Collaborative Agents are not about AI, but about designing the workspace in a way where it's safe to have agents work alongside people"

# cspell:ignore Argh
---
![image-center]({{ page.header.teaser }}){: .align-center width="85%"}

{{ page.excerpt}}
{: .kicker}

I’ve been thinking about collaborative robots lately – A.K.A _cobots_. The kind of robots that are designed to work alongside humans, not isolated behind fences.

And it struck me that we’re running into the same class of problems in software development right now, as we try to introduce AI agents into our daily work.

Not because AI is new or mysterious—but because collaboration is.

## We are focusing on the wrong problem

I've been in dialogue with several well-established Software Development teams lately. None of them have yet established an actual policy or strategy for embracing or even introducing Agentic AI to their codebases. The general pattern nowadays is that developers have been handed a license to either Copilot or Codex. Some are using it, some are not. The majority are still only using it as plain chat; copying snippets into the chat to get a fix or some feedback. Few use it integrated in the IDE, and even fewer in _agent mode_ where it can access and edit your files.

BUT: I haven't _yet_ come across a single team that is using it in a true spec-driven agentic process, where the agent sets out on a 10-20, or sometimes even 30-minute journey based on a short spec, and then comes back with a branch of code that blends in perfectly with your existing codebase, as if it was written by a skilled and disciplined colleague who knows your rule-book, sticks to the point, adheres to SOLID principles, strives for small focused change sets, makes sure the tests are still running, and that documentation is stellar.

This is how I've been writing my code for the past six months.

And this is exactly the process we keep hearing success stories about in blog posts and conference talks. I just haven't seen a real-life example from a well-established team that actually does it _yet_.

Most conversations about AI agents that I have with developers tend to focus on improving the agent itself. Focus is on:

>— _"Which model is the best?"_<br/>
>— _"How to give better prompts?"_<br/>
>— _"Should the model run in slow, fast or thinking mode?"_<br/>
>— _"Is Codex or Copilot the best option?"_

But in practice, questions like these are basically irrelevant and pointless to spend time answering. That’s not where the friction is.

The friction appears the moment the agent is no longer alone. The moment we stop letting it go rogue like a loose cannon and just _do its magic_ - and stop praising it unconditionally for _"Wow it's fast - it would have taken me ages..."_ Then the real challenge appears: operating inside a real codebase, with real constraints, alongside real developers, and inside a delivery pipeline that will actually ship to production.

At that point the problem changes completely.

It is no longer about intelligence — neither human nor artificial. It is about _interaction_.

## This is a cobot problem

Traditional industrial robots are easy to reason about. You isolate them, you define a fixed task, and you optimize for speed and precision. The environment is controlled, and the robot is allowed to be dumb, as long as it is consistent.

Cobots changed that.

Now the collaborative robot shares space with humans. No fences. This has happened despite the fact that the environment is unpredictable, robots are dangerous, and humans are fragile. Tasks have changed. Responsibility is shared.

The solution to develop collaborative robots was _not_ to make the robot infinitely smarter. Instead, we injected safety rules into the robots and designed guard rails in the environment around them. We introduced constraints, feedback mechanisms, safety boundaries, and very explicit interaction patterns. The robot became _safe_ not because it understood everything - but because it was bounded by design.

## A similar thing must happen in our repos

If we look at what it actually takes to make an AI agent useful in a software project, it looks remarkably similar.

We introduce:

- RAG files to constrain context
- Containers to control execution
- Coding standards to reduce ambiguity
- Stable In Situ tests and checks to define what “correct” means
- CI pipelines to validate behavior  

This is not AI work. This is environment design.

And just like with cobots, most of the effort shifts into the preparation phase. You don’t just “plug in” an agent. You reshape the system so collaboration becomes possible.

## The repo is the workspace

It is tempting to think that the agent is working on “code”. It is not. It is operating inside a workspace that we have carefully designed:

| Cobot world        | Software world       |
|--------------------|----------------------|
| Physical cell      | Git repository       |
| Sensors            | Tests and checks     |
| Control system     | CI/CD                |
| Safety boundaries  | Containers           |
| Vision             | RAG / context        |

The agent’s behavior is largely a function of that environment. Much less of the underlying model or the detail level of your prompt. Once the environment is set up, I run all my agents in _Auto_ mode: the agent itself picks the model that looks right for the task, given the context.

This leads to an uncomfortable but useful observation:

>— _"A messy repository will make any agent look unreliable."_<br/>  
>— _"A well-designed repository will make even a simple agent look capable."_

We’ve seen this before with humans.

## Tests and checks are the in situ interaction layer

In this setup, tests and checks are no longer just verification. They become the primary way the system communicates expectations.

They define:

- what matters  
- what is allowed  
- what “done” looks like  

They provide immediate feedback when those expectations are violated. This is very similar to how a cobot relies on physical feedback—force limits, resistance, boundaries—to stay within safe operation.

Here comes the rant: a trend around the fabled _pipeline_ has gone badly off the rails in recent years. It is now a _pipeline gone bad_.

I see teams working with so much `YAML` and declarative code in general that they lose oversight. They do not componentize their pipelines. For some reason it appears that _copy'n'paste reuse_ is allowed when it's `YAML`; I see the same code snippets reproduced everywhere.

You rely on it for your verifications, validations, pull requests, peer reviews, deploys, and releases. Your work process becomes dependent on your pipeline. But the paradox is that most teams do not have access to execute all that `YAML` code in their development environment. It runs _after_ you have committed and pushed your code. The _pipeline_ is actually a remote dependency.

>— _"The copy'n'paste reuse is error prone!"_<br/>
>— _"The artificial wait-states slow you down!"_

## This is what “shift left” actually means

Shift-left is often interpreted as _"run tests earlier"_. But in my book, _earlier_ is not interesting in itself. The meaningful interpretation is:

>— _"Developers should work against the same expectations that the system will enforce later"_

Not approximations. Not simplified versions. The same tests. This is especially important when we strive for a collaborative engagement with AI agents. You get:

>— _"AI agents should work against the same expectations that the system will enforce later"_

When an AI agent sets out on a spec'ed journey, by design it returns when it thinks it's done. But if most verification happens in a remote pipeline, it has no access to _the definition of done_. It will _think_ it is done long before you are ready to accept its contribution, and you will get frustrated and claim that _"AI agents are useless"_ or _"...not yet mature enough"_. But the ugly truth is often that the team is not yet mature enough to utilize them, because of how the development process is organized. With a _pipeline gone bad_.

## "Detroit" vs "London"

<div>
<p><b>Detroit school</b> — <em>state-based testing</em><br/>
Verify the <em>outcome</em>. Use real objects. Mock only at system boundaries. Associated with Kent Beck's original TDD. Tests assert externally observable behavior and tend to be less coupled to internals.</p>
<p><b>London school</b> — <em>interaction-based testing</em><br/>
Verify the <em>interactions</em>. Mock all collaborators. Each class is tested in isolation. Associated with Freeman &amp; Pryce's <em>"Growing Object-Oriented Software, Guided by Tests"</em>. Tests are often fine-grained and coupled to collaboration design.</p>
<p>The debate is old, but the implications for pipeline design — and for AI agents — are very real.</p>
</div>{: .fact .right .small}

Where I think many teams go wrong is that they treat different stages of the pipeline as fundamentally different contexts:

Unit tests here. Integration tests there. End-to-end tests somewhere else.

Each with their own setup, their own data, their own assumptions. That creates fragmentation. And fragmentation is exactly what makes collaboration between humans and AI hard.

The _unit tests_ are often the _only_ tests that can run in the development environment, and they are typically based on a _London school_ approach that heavily utilizes mocking. These tests are often harder to maintain when refactoring and rework happen frequently. And in a collaborative workflow, frequent refactoring and rework are exactly what you want to enable.

The alternative is more demanding, but also more powerful. You focus on testing the stateful behavior of your system. For that you need to establish state rather than mock interfaces. This is done through maintaining and carefully juggling version-controlled test data, building emulators, and serializing/deserializing objects.

>— "Keep the tests the same. Change the environment".

Instead of writing different kinds of tests, you write tests that express behavior, and then you control _what they run against_.

- In early stages, during development, you can inject synthetic test data, your tests run in an _emulator_.  
- Later, you run the same tests against real systems - now the emulator is out. The data may still be synthetic, but it's no longer _injected_.
- Eventually, those same tests become part of verification in production-like environments  
- And finally you can run (some of) them as smoke-test validation in real-life production systems.

The test does not change. Only the _source of data_ behind it does.

You need:

- stable test data strategies  
- environment-agnostic test design  
- clear contracts around dependencies  

Yes it's harder to establish. But once in place, it creates a system that is far more robust—and far more collaboration-friendly.

## The difference between _checks_ and _tests_

When I refer to _checks_, I use it as a near one-to-one synonym for _Static Code Analysis_. You would be amazed by how much quality you can get in the long haul by setting up very strict _checks_:

- Linting
- Formatting
- Spell check
- Syntax check on interpreted (non-compiled code)
- Schema compliance on declarative code
- Cyclomatic or McCabe complexity in your imperative code
- Coverage threshold on your _unit tests_

I even argue that what we usually refer to as _builds_ or _unit tests_ can, in this framing, also be seen as forms of _Static Code Analysis_. So in the _checks_ category I also have:

- Build (for compiled languages)
- Packaging for deployment distribution
- Running tests with coverage

The good thing about all of these checks is that they can reduce the perceived need for tedious peer-reviews[^peer-review]. But even better, these checks execute really fast - often in fractions of seconds - and they are often unrelated, so they can run in parallel.

[^peer-review]: Peer reviews used as blocking quality gates are considered _tedious_ because they generate idle time in your cycle time, cognitive load, task switching, and arbitrary opinionated quality gates. It is a clear definition of waste _(muda)_ in a lean value stream.

In my agentic collaborative workflows I have consequently reintroduced an old workflow construct that most teams never used or forgot existed: the `pre-commit` hook. And that hook executes all of the above on _every single commit_ - not in the pipeline, but in situ, in the repo.

And consequently: So does the AI when running in Agentic mode.

## Preparing for non-human contributors

If we bring it back to AI agents, this approach has an important side effect.

It reduces ambiguity.

The agent does not need to guess:

- which tests and checks matter
- which environments behave differently  
- which assumptions hold  

Because the system is consistent.

And every time the agent thinks it is done, it will try to commit to its branch and then perhaps it will get 35 linting errors, 2 broken tests, coverage that is 5% below threshold, 4 spelling mistakes, and a build that mysteriously fails on ARM64 on one of the three OSes we support.

From a software developer perspective, this often triggers a reaction along these lines:

>— _"AAAArgh! I'm wasting my time here! How can I bypass this - I KNOW it's not working yet. I'll fix it later!"_

The life of an agent is completely different. If you run it in _thinking mode_, it will probably react like this:

>— _"I need to fix the tests and the coverage and the linting and the formatting, and the ARM64/OS combination non-compliance — done!"_

And on top of that: if you build your RAG instructions carefully, mention that you adhere to the Detroit school of testing, require stellar documentation, and require a thorough summary in issue comments for the full change set - then the bar is clear. If discoveries are made, or existing code is reworked, those decisions should be documented in existing or additional RAG files in the repo. Add markdown linting on your `*.md` files, and you get flawless standardized markdown.

The simple point to make here is really: **When you build a mature flow, the AI is suddenly not immature anymore.**

And it's not only faster but often also better and certainly more diligent and thorough than most developers.

## The shift we are in

I can set the agent off on three different specs at a time. I never let it commit directly to `main`; it hands me a separate branch where it claims _"I'm done - I did all you asked of me"_. And I will check.

It's true that my role as a developer is shifting a lot in this scenario. I compare it to giving a junior developer a well-defined task and, when they are done, spending time reviewing the work. Usually this is less a quality gate and more a learning situation. I'm essentially onboarding: helping that person learn the ropes and understand how we work, including all the things we didn't explicitly document but still expect a mature contributor to navigate professionally and diligently.

With the agent it is still very much a learning experience. But often it's me learning: _"What is this construct in the programming language - I've never seen that before"_ and then I get my _"Ohhh - that's clever"_ epiphany. Or if I sometimes get crap or unexpected results, I immediately and unconditionally accept the challenge that it's not the AI that is _dumb_; it's my guard rails and checks that aren't tight enough. And instead of correcting or commenting the code the AI contributed, I go back to update my RAG files, add more checks, refine the spec, or whatever else I assume is required. Then my next prompt is:

>— _"I updated bla-ha.instructions.md and I added a few more tests to the pre-commit hook - can you please review your own contribution based on this new info."_

And then we continue this way - until we're done.

It's collaboration!

## A final reflection

So maybe this is the real shift. We are not moving towards a future where AI writes code for us. We are moving towards a future where:

>— _"We design software systems that can be safely interacted with by actors that do not fully understand them."_

Humans and AI agents alike.

AI just makes the problem visible.

Cobots didn’t succeed because robots became perfect. They succeeded because we learned how to design environments where imperfection was safe.

If we do that same thing in software, the interesting work is not in the agent.

It is in everything that surrounds it.

---
