---
---

### PolyScope is treated as a monolith

Even though PolyScope generates multiple JAR files, it is treated as a monolith. 
One of the jar files contains 80% of the code. 
That is possibly a monolith. But, conceptually, the rest aren't.

#### Treat each JAR as a component (C)

If possible, you should treat each JAR as an individual component.
Give them their own pipeline so you can release and version them individually.
This would help cut down your build times as you avoid rebuilding the individual components.

### Monolith build structure for PolyScope and Controller

PolyScope and Controller may look like a monolith, but that is actually not true. 
They are two separate artifacts, but they are glued together by the build system and generation of the messaging API.

#### Separate the two subsystems (M)

It is understood that features and fixes often result in changes to both subsystems. 
The same goes for updating the APIs and messages. 
The APIs should be managed as dependency, which would resolve the subsystem coupling. 
See the API solutions under *Dependencies are managed* for more information.
