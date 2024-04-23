---
title:      Individually releasable components
caption:    Components should have low coupling and be self-contained
level:      75
area:       arch
visuals:    []
throughput:
feedback:
payback:
simplicity:
weight: 4004
---

This principle lends itself to common coding standards of high cohesion and low coupling.

Break down your monolith, identify all the nuts and bolts in your architecture that produce an actual artifact - like a binary executable from compilation or any other kind of _package_.

Make these components self-contained with it's own definition of done, it's own pipeline, it's own interface - it's own release process.

Treat it as inventory and manage your dependencies.
