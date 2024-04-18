---
---

**_Note:<br/>The following is a curated mix of illustrative findings from various anonymized reports_**


## It builds on _my_ machine

Builds and tests run on individual developer's self-maintained machines and workspaces, as no standard image for this exists. 
This results in an undesirable _"Well, it works on my machine"_ scenario. One developer can have a hard time redoing another developer's work. The team suffers from a lot of _false negatives_. Builds fail often. Not because the code is broken, but because the build environment is.

### Use a clean standardized image for the toll gate job

Code changes should be built and tested on a standard and _clean_ image. The image should be maintained by the team.
This prevents local configuration from tampering with the builds, making them deterministic and consistent.

#### Developers use reference image

Ideally, there should be no difference between a developer's environment and that of the toll gate. 
This is achieved by making it easy for developers to spin up the standard image to run their builds, allowing them to [easily produce the same result](/on-demand-environments/ "Access to production-like environments") as the toll gate job.

## Final delivery to customer is not automated

The image given to the customer is generated before final test in a non-reproducible way. 
It is built manually based on an already running device with an other, older image. 
It is modified by manipulating files within the device before a final image snapshot. 
Conceptually the image could be broken during the creation process.

### Automate image creation

Any release artifact should always be possible to reproduce without any doubt. 
It should be scripted 100%. Programmable and immutable.

### Make the image generation stateless

A product to a customer should always be generated from scratch in order not to propagate error prone states. 
It should also always be reproducible through a declarative pipeline.

##### Automatically test the image

The automatically generated image is tested as part of a pipeline.
You want to extend the pipeline as far down the release process as possible.

## Release process is, to a large extent, manual

The majority of the release process located in the *Front Office* is a manual one, which is costly, lengthy and error prone, e.g. the image creation, release notes, support site updates, etc.

### Design the release process for automation

It is important that each step is designed for automation. 
Make sure the physical resource are available and enabled for automatic deployment. 
It relates to servers, but also devices that they can be claimed, started and the execution evaluated.

### Script each single step to enable automatic execution

Identify the process steps that are manual, entirely or even partially so. 
Automate step by step and integrate them into the pipeline.

## Build script is an plaster on the monolith

The build script is created to handle the monolith by plastering each of the subsystem builds into a single step. 
The different subsystems have different build technologies (e.g. Maven and Scons), but in order to make it all work as a monolith it is wrapped with shell script. 

### Split the monolith and add dependency management of the artifacts

Splitting the monolith into subsystems and implementing true dependency management makes the build script obsolete. 
It simply vanishes. Please refer to the [architecture cards](/areas/arch/#tag "Architecture & Design") for more information.

## Localization files are introduced late in the release process, leading to unexpected UI changes

Localized text in the UI can cause the UI controls to change in some unexpected manner, e.g. resizing of buttons due to translated texts being longer than their original.
_Commit-stop_ is the point where no further features, and thus no new text, gets added.
Translation can take up to one month and arrives fairly late in the release process.

#### Create requirements for localization subcontractor

Create criteria or a framework that helps these text translators adhere to font type, font size, etc. 
This gives them the opportunity to react early and discuss with you any problematic translations.

This will minimize, or even completely avoid, nasty surprises near the end of the release process.

## Manual process to create a buildable workspace

It is not possible to start building from a clean checkout. 
You have to checkout two repositories and create a symlink in order to be able to build the software. 
It is a hidden dependency.

#### Make the 'link' permanent by using a explicit dependency

Create a 'thin shell' repository which contains the dependency between these repositories.
In SVN it is called an _external_, in Git it is called _submodules_. 
You could also pull the dependencies from Artifact Management system if the repositories have their own pipeline and definition of done. 
The implementation depends on the technology. The important point is the dependencies are managed and versioned.

## The pipeline scripts contain domain specific logic

Your pipeline scripts are bloated with domain specific logic and setup. 
Much of the script relates to setting up environments and requirements to build the software. 
The pipeline scripts become large and unmanageable.

### Keep domain logic out of pipeline scripts

Consider your pipeline definition as _configuration_ rather than _a script_ to help keep it lean.
Avoid building logic into the pipeline script that has nothing to do with either CI system's interface, execution or reporting. 
Remember that all the logic you put in these scripts is also something developers would need to run at their desk, should they want to recreate runs locally. 
The pipeline script makes for a poor place to document these setup steps
