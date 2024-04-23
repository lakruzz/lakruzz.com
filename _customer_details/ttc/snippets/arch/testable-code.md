---
---

### PolyScope's monolithic JAR

The PolyScope consists of many Java components, but one of them spans some 80% of the code base. 
This is often a red flag.

During our discussions it was stated this could be the root cause of non-deterministic tests, though no consensus on this statement was reached.
There is still awareness in the development team of the situation and ad-hoc improvements are done to improve it and split functionality to new components. 
This has been proving difficult due to the tight internal coupling, however. 

#### Describe the current and desired architectural picture (M)

It's important to picture and describe the current as well as the desired architectural state.

- It provides a foundation for discussion and a common understanding of where PolyScope is at and where it is heading.
- It enables future architectural endeavours, if necessary.
- It'll help developers to prevent architectural technical debt when implementing features or fixes.

#### Breakdown and prioritize the architectural work (M)

Build an architectural backlog in order to improve this area. 
There seems to be a common understanding that even the customers will benefit from this directly, as it results in a more stable system.

