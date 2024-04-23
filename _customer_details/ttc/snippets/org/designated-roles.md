---
---

### Vague responsibility of pipeline definition

The goal and feedback needs of the pipeline are unclear. 
DevOps create and maintain the pipeline for the purpose of securing the build and artifacts for testing. 
Developers have different interests, as they want a fast feedback loop, as the current feedback loop is long (2-3 hours). 

#### Settle the responsibility between infrastructure, DevOps and domain (S)

Split the ownership of the pipelines and the Jenkins build agents.
The Jenkins setup should be owned by DevOps, while the responsibility for the pipeline definition lies with the component's software architect.

### Front Office is an organizational 'hot-fix'

Front Office is doing great and important work, but is essentially an organizational patch to fix the noise in development due to many customer opened issues.
Based on the workshops, it seems the team handles technical customer support and release management (preparation and execution). 
Customer support is important as a professional inbound and outbound communication and filter for development tasks. 
The preparation and execution of releases is, to a large extent, manual work, and the long lived branches aren't helping.

#### Move Front Office back into R&D (C)

As you cash in on process improvements, the need for the glue-on quality efforts after 'commit-stop' will dwindle as quality is being built in.
It's important you register your improvements and evolve the organizational structure alongside them.

### Outsourcing service of non-domain applications

Applications like the Atlassian stack and Nexus should **not** be maintained by R&D personal (DevOps).

#### 'Outsource' administration of standard applications to the IT department (SaaS) (S)

Outsource administration of your non-domain applications, have your DevOps team focus on optimizing the processes and usage of these applications instead.
Core operations should generally deliver hardware and SaaS of standard applications, e.g. Atlassian Suite, Nexus, etc.
