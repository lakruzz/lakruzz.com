---
title:      Adaptive test suites
caption:    Only run the required tests - you know which ones I'm talking about! Right?
level:      75
area:       qa
visuals:    []
throughput:
feedback:
payback:
simplicity:
weight: 1004
---

When your test cases are self-contained with individual _setups_ and _tear-downs_ and they trace to related functions and features, you are able to analyze a given change set, place it in context of a limited amount of features and derive its relevant test cases.

Then you can construct an adaptive test suite on the fly and execute that on a production-like environment.

By running a small and relevant subset of functional tests, you can add functional testing to the short feed-back loop.
