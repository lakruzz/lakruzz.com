---
title:      Maintain test data
caption:    Test data as code
level:      45
area:       qa
visuals:
throughput:
feedback:
payback:
simplicity:
weight: 1003
---

Management and maintenance of your test data is considered part of your Quality Assurance strategy. Your test data is versioned and stored as an artifact.

This implies that you separate your test data from the actual tests,
which in turn comes with the benefit of easily running test suites with different, versioned data sets.

Test suites becomes self-contained, each with their own easy reproducible _setup_ and _tear-down_ steps, something that will later enable you to run your test suites independently of each other - maybe even selected on output from previous verification steps in your pipeline.
