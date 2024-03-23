---
---

### Messaging protocols (and public API) aren't managed/versioned

The messaging protocols of your systems are not managed or versioned. 
Historically they have been hardcoded in each subsystem and had to be synchronized manually. 
Recently, you've set up automatic generation of the interface from a source code independent language to support all systems. 
The result is that the subsystems are now tightly coupled with a pre-build task that needs to run for each of them.

#### Supply the messaging protocols with their own pipeline and DoD (M)

Create a separate repository with its own pipeline, generating the required artifacts for your various programming languages.
The artifacts can then be added as dependencies to each subsystem.
Consider generating public API documentation through this as well.
