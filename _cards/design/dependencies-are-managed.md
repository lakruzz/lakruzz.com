---
title:      Dependencies are managed
caption:    Get your dependencies straight
level:      50
area:       arch
visuals:    []
throughput:
feedback:
payback:
simplicity:
weight: 4003
---

All software has dependencies; 
You may be using third party technology or you have a lot of individually released microservices, frameworks or libraries in your system architecture.

Make sure there are no moving targets and don't rely on someone else's _master_, _latest_  or _stable release_. Cache everything you need in your own registry.

Optimize your link processes to use cached dependencies when available, optimize your compile processes to feed the registry when new versions are created, so others can benefit from them.
