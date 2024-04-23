---
title:      Payback
caption:    The payment to your technical debt
weight:     30
---

For most software projects it's the code's complexity and technical debt that eventually makes it obsolete.

Every time we touch the code, we're jeopardizing the original design and quality.
Either by adding quick solutions that don't scale or because we simply don't add non-functional 'abilities' to the solution.

Testability, traceability, maintainability, supportability, readability... These kinds of abilities.

We're building up technical debt - debt that will have to be paid back or you'll end up broke.

For each card ask yourself the following question:

> To what extent would implementing this feature or ability help to pay back on technical debt or actively prevent more debt from being added?

The payback is measured from one to three stars. Use the stars as follows:

{% include func/stars.html star_count=1 %}

It sporadically affects _code snippets_ at an individual level.

{% include func/stars.html star_count=2 %}

It affects _design_ at a team collaboration level.

{% include func/stars.html star_count=3 %}

It affects _architecture_ at a corporate asset level.
