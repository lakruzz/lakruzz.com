---
title:      Automated builds
caption:    Yes. But it doesn't build on THAT machine.
level:      15
area:       build
visuals:    
throughput:       
feedback:
payback:
simplicity:      
weight: 0001
---

When code changes are committed to the repository, your CI server kicks in automatically and starts a build.

It might not even be an actual _build_, it can be any kind of automated action that is part of a verification process implied in the project's "definition of done".

If a build step fails, the developer is notified directly so he can start working on fixing the issue immediately. The shorter the feedback loop, the better.
