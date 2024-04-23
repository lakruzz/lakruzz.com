---
---

### Nexus setup not optimal

The setup used in Nexus is not as the tool is designed and intended for. 
The root structure is projects and a semantic structure with package and version below. 
The current setup abuses the root structure as it is both the project and version which means that newcomers are confused and the root structure is polluted and grows as more releases are produced.

#### Implement best practice structure (C)

Store the artifacts in a hierarchical tree structure. 
It should also be done for non-Java artifacts if there is no explicit reason to not do so. 
Always respect the intent of a tool. 
It may also make the automating of the dependency management less complex if there is a consistent structure for addressing the artifacts.