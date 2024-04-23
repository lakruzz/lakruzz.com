---
title:      Full audit trail in production
caption:    Oooh - If only you knew what happened before the smoke came
level:      85
area:       arch
visuals:    []
throughput:
feedback:   
payback:    
simplicity:
weight: 4005
---

When something goes south - it's usually in the production environment - where _you_ don't have access to debug or profiling information.

Design you code, so it can produce an audit trail - a complete profile of states, sequences, data in and out. That should give you clues, when you try to do your code-scene forensics.

At least you'll get some clues on how to reproduce the error in your development environment.
