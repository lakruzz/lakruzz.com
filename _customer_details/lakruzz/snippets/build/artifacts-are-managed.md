---
---

**_Note:<br/>The following is a curated mix of illustrative findings from various anonymized reports_**

## Artifact management system configuration not optimal

The setup used in Artifact management is not as the tool is designed and intended for. 
The intended root structure is _projects_ and on top of that a semantic structure with package and semantic version below. 
The current setup abuses the root structure as it is both the project and version which means that newcomers are confused and the root structure is polluted and grows as more releases are produced. The structure you've set up requires advanced logic in your build scripts rather than just simple SemVer logic.

#### Implement best practice structure

Store the artifacts in a hierarchical tree structure. 
It should also be done for non-Java artifacts if there is no explicit reason to not do so. 
Always respect the intent of a tool. Read the manual again, follow some of the tutorials for the tool.
It will make the automation of the dependency management less complex if there is a consistent structure for addressing the artifacts.