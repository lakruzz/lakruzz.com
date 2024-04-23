---
title:      Test in production
caption:    Murphy and me - Errors will eventually happen in production
level:      85
area:       qa
visuals:    
throughput:
feedback:     
payback:    
simplicity:       
weight: 1005
---

A word of precaution; _testing in production_ is not to be confused with _releasing untested code_.

It starts with acknowledgement that all serious problems are discovered in production and occurred because unforeseen things happened.

Deliberately go to your production environment and do unforeseen things like turn off a server, kill a process, pour coffee on your keyboard, upgrade a service during high-load.

If your system is built to survive it, then it should! You're only sure it will if you (dare) test it.
