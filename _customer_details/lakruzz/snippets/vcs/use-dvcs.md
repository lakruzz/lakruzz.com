---
---

### Current VCS does not support CI/CD well enough

Subversion is too inflexible and and clunky for a real automated CI/CD approach. 
Branches are basically file system copies, which can be a performance nightmare with large repositories. 
The developers and pipelines alike are negatively impacted by this. 
The developers don't want to branch because it takes too long, while the pipelines become slow and result in a slow feedback cycle. 
Not only branching, but also merging is expensive in SVN compared to distributed systems.

#### Institute Git (M)

Git supports the automation and CI/CD approach far better. 
Branches are cheap and fast, as they're just simple pointers. 
And as Git is a true DVCS, you gain all the performance benefits of a true local repository clone. 
Rapid checkouts, merges and diffs among them.

#### Create your migration strategy (M)

You need a migration strategy! 
The proper strategy for you remains to be determined, as it really depends on the desired result. 
What we do _not_ recommend is a partial migration, i.e. moving only portions of the code base to Git. 
Not because this isn't a valid option, per se, but rather due to the teams needing to align their processes, while such an approach would introduce even more divergence and complexity.

Below are some strategies to consider:


**Mirror SVN**


One approach for the migration to Git that allows the flexibility to continue working in SVN while preparing for a move to Git is to  _mirror_ it in Git. 
There are several tools for doing this. [SubGit](https://subgit.com/) is a tool we have used before and is something you can take a look at. 
If you want to use BitBucket then that is also a possibility with a commercial [plugin](https://marketplace.atlassian.com/plugins/org.tmatesoft.subgit.stash-svn-importer/server/reviews). 
A standalone tool which is often used is 'svn2git'.

This will make the move to Git a less critical and blocking task and allow for a gradual and planned move to Git while gaining knowledge and experience with it.


**One big cut-over to Git**


Another approach to the migration to Git is a straight forward cut-over. 
In principle, a mirror introduces a layer of complexity which you will not have with a cut-over.


**Hybrid**


You could do a hybrid approach. 
Where you mirror in Git, while preparing for a more detailed cut-over. 
This approach would allow you to work on splitting your code base into the wanted repositories, find implicit dependencies, prepare pipelines, etc.

#### Split them with an automated approach (S)

No matter which migration strategy you choose you will want to look at splitting the one big repository!
If you split the code base into more edible chunks, you'll have a far easier time with many of the other tasks that come with implementing a full CI/CD approach. There will be some natural split points, e.g. the subsystems. Other's won't be as obvious, though.

If you automate the repository splitting process, you'll allow yourself to do it in a more controlled manner. We have done this for other customers.

* Describe the desired split in a configuration file
* Execute scripts that split the repository and maintain the history, resulting in the wanted repositories
* Redesign the pipeline to handle the new structure
* Do exploratory testing on the repositories:
  * Act as a developer, replay commits and test your process and integration
  * Execute the pipeline(s)
* Decouple where necessary

Rinse and repeat the processes until you have the desired repository structure.
