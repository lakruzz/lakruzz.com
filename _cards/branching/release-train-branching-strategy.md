---
title:      Release train branching strategy
caption:    Tug along or be left behind - we're releasing on rails
level:      30
area:       vcs
visuals:    
throughput: 
feedback:   
payback:    
simplicity:       
weight: 2002
---

The release train branching strategy is similar to what is sometimes referred to as _late branching_ or _trunk based development_. 
Essentially it implies that in your entire branch tree there is only _one_ branch that is meant to be long-lived.

Consequently, there is only one way you can contribute to a product and have your code released, and that is to deliver your code to the mainline.

In a release train strategy, the mainline is on it's way to production all the time, and therefore anything that isn't meant for production as soon as possible, shouldn't be delivered to the mainline.
