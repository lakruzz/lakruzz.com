---
title:      Unit testing, mocks, stubs and proxies
caption:    Keeping a check on your code's behavior
level:      10
area:       qa
visuals:    
throughput:        
feedback:
payback:
simplicity:      
weight: 1001
---

Unit tests are used to test the semantics of your code; To verify it works as expected and keeps working as expected through changes.

Unit tests are light-weight and fast. Don't get tangled up in hard-to-handle dependencies such as loading databases or instantiating long sequences of objects before you get to the actual testing, use mocks and stubs to simulate your first order dependencies. Or use Proxies to have non-local collaborators contribute to your test.

A unit test is quick to execute and it should be executable in the context of your development environment.
