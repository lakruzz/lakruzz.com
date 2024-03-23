---
---

### No clear convention on product or subsystem versioning

It was unclear how the dependencies were defined and used in the 'aggregations'. 
The different subsystem artifacts were used as dependency, but there seemed no release cycle for each subsystem.

It was also unclear how the public APIs were versioned.
You'll find it very difficult to implement proper dependency management if a standardized way of versioning isn't used.

#### Define standard version strategy (M)

A well defined versioning strategy should be used across all released modules. 
It forms the basis for dependency management.

An example is [semantic versioning](http://semver.org/): MAJOR.MINOR.PATCH

* MAJOR version is bumped when you make backwards-compatibility breaking changes.
* MINOR version is bumped when you add functionality in a backwards-compatible manner.
* PATCH version when you make backwards-compatible bug fixes.

_**NOTE:**_ Version extensions are for internal component use only. 
Teams can freely define extensions like -SNAPSHOT for Maven or appending the SHA1 or build number to semantic version.
However, these should remain internal for the component in question. 
All dependencies across components should only use the defined version strategy without extensions.

#### Define the process for how a release is made (M)

You need to tie your version to a release by defining when and how a release is done.

**Example: **
You have a pipeline view with 20 verified changes. 
Each pipeline has produced a binary package. 
Once the accumulated feature set has reached the desired state, you run a release job via a manual trigger. 
The job will tag the change set, release the binary to an artifact management system and bump the version to target the next release.
