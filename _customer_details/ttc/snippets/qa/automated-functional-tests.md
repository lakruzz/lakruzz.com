---
---

### Lack of a test strategy

From the workshops we determined the software developers and testers weren't always aware of what tests were executing or were intended to verify.
Without a strategy in place, it becomes difficult to define and determine the _who_, _what_, _when_, _where_ and _how_ of tests.

This often results in:

* Duplicate and redundant tests
* Incomplete test suites
* Repetitive tasks
* Slow feedback loops
* Inflexible pipelines
* Difficult maintenance of tests
* Incomplete overview of quality

#### Define levels of testing (M)
 
It is important to know when to execute your specific test suites, especially in a CI/CD environment. 
Generally, the further down the pipeline you get, the deeper you want to test. 
Structure your tests into levels to accommodate this.

For example:

* Toll to get into the trunk
* Smoke for minimal verification
* Regression for verifying you didn't break anything
* Production-like tests
* etc.

#### Define and share your test types (S)

It's very common for misconceptions and misunderstandings to occur when developers don't properly define their test terminology.
Make sure you are all on the same page when it comes to your language around testing.
Do a small write-up or come to a consensus on at least the following terms:

* Unit tests
* Integration tests
* Functional tests
* UI tests
* E2E tests

#### Define roles and responsibilities (S)

Define who is responsible for which areas of testing. 
For example, developers should probably be in charge of unit testing.
But in some cases, depending on the organization and culture, other responsibilities aren't always as clear. 
Developers also often implement functional and integration tests, preferably while working in pair with a domain/test expert. 
This is recommended for Agile teams today, as it helps build quality into the product.

#### Define your metrics and thresholds (M)

Metrics and thresholds are a powerful tool for building quality into a product.
Use them as quality toll gates for entering the mainline or promotion.
You already use SonarQube but it doesn't seem to b acted upon.
 
Consider metric thresholds such as:

* Minimum test coverage
* Maximum compiler warnings
* Maximum amount of TODO or FIXME comments
* etc.

#### Define your tools and approach (S)

In order to implement a test strategy, you'll need to define your approach and tools.
Not doing so will make it very difficult, if not impossible, to implement tests in a consistent way.
Align your tools and test strategies for your various programming languages to make sure they are consistent.

#### Tests should follow the code base (S)

Tests should follow the sources they are verifying, through branches and merges.
The last thing you want is for your tests and code to be out of sync, as it just generates a lot of noise.

### Tests aren't deterministic

There were several mentions of unreliable tests that produce unexpected failures when run multiple times on the same change set.
Test should be deterministic. You want the same result when they are run on the same code with the same parameters in the same environment.
If your tests aren't deterministic they are _very_ near to useless.

It's absolutely critical that your tests are reliable, as false negatives/positives destroy the value of your automated test suites.
Your developers will also incur a loss of faith in the test suites, often as far as being reluctant to add more tests cases to prevent the suites from becoming even more unreliable.
This is dangerous entropy that must be actively combated.

#### Quarantine your unreliable tests (M)

Avoid the ripple effect of unreliable tests by quarantining your broken tests.
Build failures should always happen for a good reason, otherwise the value of your pipeline sinks dramatically and people will start ignoring broken builds.

Identify and quarantine your problematic tests as soon as possible. 
This will go a long way towards stabilizing the pipeline and increasing confidence in the feedback loop. 
An option is to place them in separate suite and execute them pipeline branch as a non-blocking step.

#### Analyse and fix your quarantined tests (S)

Isolate each quarantined test and execute it individually to determine the root cause of its intermittent failures. 
This can also be helpful in determining hidden dependencies.

#### Restructure you tests (S)

Inspect your tests and decouple them where possible. 
Your tests should cover a specific set of functionality. 
Ideally, this functionality should not cross domains.  
Your tests should be able to run in _any_ order, as a completely isolated unit.

#### Provide reproducible and stateless environments for your suites (S)

An execution of a test suite should not be influenced by previous runs or parallel execution of other suites. 
The test environment and all its dependencies should be easy to reproduce by developers.

#### Analyse your code and determine its testability (S)

The value of your tests is directly related to the code it is testing.
Review your code for testability, as code that is difficult to test comes hand in hand with fragile suites.

### Lack of a test inventory

You have a fair number of manual tests, making it difficult to build a test inventory for your CI/CD system to run.
You'll need an inventory of automated tests available to if you want to scale automatic determination of code quality.

#### Promote test writing to a deliberate task (S)

Consider creating Jira issues for the development of a functional or integration test.
Link it to the relevant user story and assign the appropriate tester. 
The developer can then implement the test with help from the tester.
This will help you build an inventory of high quality tests.

#### Chose a test specification language (S)

If your test inventory is to be valuable, you'll need to know how to read and expand upon it easily.
Gherkin is popular today for bringing test specifications to a higher level and describing them in a human readable language. 
This is done prior to implementing the feature and enforces test driven development, which in turn helps writing testable code. 
The choice is, obviously, yours. This was just an example, but some type of specification language should be agreed upon.

#### Version control your tests (S)

Treat your tests as code, store them in a version control system.

Consider the following:

* Unit tests should be stored alongside the source code of the component they verify.
* Functional tests should be stored alongside their subsystem.
* E2E tests should stored with the product.

#### Introduce a Jira test plugin (C)

There are several test plugins in Jira which help in the management of test inventory. 
Introducing one of could prove useful in managing your tests, take a look at Zephyr or Xray.

### Test failures are ignored

Failing tests are ignored. The reasons could be based on several factors.

* The tests are faulty
* The tests are redundant
* The tests are unreliable
* No one owns the test

#### Remove redundant tests (M)

Simply remove tests if they are redundant or useless.
They're only slowing you down.

#### Fix faulty tests (M)

Valuable tests that are faulty should be fixed, especially unit tests.
Unit tests should be majority of your inventory and are extremely useful as toll gate criteria, you want them to be in good shape.
They should be able to run on both developer and build server environments with the exact same result.

#### Define responsibility (S)

Define who is responsible for automated test failure.
If the test isn't faulty, then it's probably the developer that made the changes, otherwise it should be that test's responsible.
In case the test isn't owned by anyone, assign someone!

### Manual testing is a standard procedure

You have too many manual tests, these create queues, wait times and resource conflicts.
Manual testing is very costly and time consuming, but also fragile and prone to error due to the human factor.
They also rely heavily on tacit knowledge and don't scale at all.

#### Make automatic tests part of your acceptance criteria(M)

Make the required automated tests part of the acceptance criteria for each story. 
No story should be closed unless the relevant tests are part of the automated pipeline and pass.
If you are testing manually, automate it!
