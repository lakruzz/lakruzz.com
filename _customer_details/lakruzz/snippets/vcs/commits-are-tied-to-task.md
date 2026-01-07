---
---

### A fifth of your tasks are tied to a "Trash can" task.

You have a "trash can" task in Jira, which is used throughout all releases.
Commits lacking an appropriate item on the backlog or sprint are tied to this task.
This is a thorn in the side of traceability and resource management.

#### Create Jira issues for each work item (S)

Document your efforts in appropriate Jira issue.
If it's worth working on, there's no need to hide it.
This creates better traceability and allows for better planning, as recurring tasks may bring choke points and bottlenecks to light.

#### Block delivery of commits without a valid Jira issue (C)

You do not want to accept *unknown* changes into your codebase.
Block commits that aren't tied to a Jira issue of your milestone.
Knowing exactly what is in a release is imperative for proper traceability and automated change logs.
