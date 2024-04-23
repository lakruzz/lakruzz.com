---
title:      Score
caption:    Adding priority to the cards
weight:     50
---

The card score is calculated based on the values of the gauges.

The algorithm used is:

    (throughput + feedback + payback) × simplicity

By multiplying with simplicity the algorithm has a built-in favor for features and abilities that are easy and simple to implement.

Take the following two cards for example:

Automating the entire functional test will score 3 in _throughput_, 3 in _feedback_ and 1 in _payback_ but only score 1 in _simplicity_ because it will take months to implement
- the score is (3+3+1)×1=__7__  in total.

Adding an automated integration to the master branch that can guarantee that it's always buildable and pristine will score 2 in _throughput_, 3 in _feedback_ and 1 in _payback_ but score 3 in _simplicity_
since it's not a huge effort to implement - the total score is (2+3+1)×3=__18__.

Automating the integration is essentially a low hanging fruit.

Although these fruits may not represent the biggest pains, they do create a lot of visibility which will help you gain confidence, credit and budget from your line organization.

The method defines _low hanging fruits_ as anything higher than 15 - with 3 in _simplicity_ and blockers as cards with 1 in _simplicity_ but total score of t or higher.
