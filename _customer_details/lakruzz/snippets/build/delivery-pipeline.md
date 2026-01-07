---
---

### No pipeline measurements
There is no overview of the pipeline's performance and how expensive its individual steps are.

#### Collect execution times of your pipeline steps  (S)
The feedback loop is something you'll have to continuously work on and improve. Collect data on the execution times of your pipeline and its individual steps. This will help you locate bottlenecks for optimization, but also lets you keep a watchful eye out for regressions in your execution speed.

### Developers are waiting on feedback
Developers are pre-verifying changes in their local environment to avoid breaking trunk.
This slows down integration as the build and its tests are taking too long.

#### Let the CI system do what it's good at (M)
Configure the CI system to test delivered changes and protect the trunk from any regressions, i.e. set up a toll gate for code changes. The pipeline should serve as the developer's workhorse, doing these menial tasks for them.

#### Build only what is needed (M)
Rebuilding unchanged modules or components is a waste of time. Optimize your build scripts to avoid rebuilding artifacts.

#### Mock and stub early (S)
Mock and stub away the dependencies of your unit, component and API tests. These usually make up for the majority of your tests and are perfect candidates for toll gate testing. They should, however, execute _very_ fast. Mocking away slow dependencies cuts down their run times, preventing them from causing a wait state before integration.

### Broken builds are manually assigned resolver
The Jenkins build fails. But who is reacting to the failing build? Currently the process is to update the proprietary Jenkins front end with the person taking action. But It is unclear who is actually responsible for investigating a failing build and finding who is responsible for getting it back on track.

#### Last commit is initial responsible (S)
The developer responsible for the last commit collected by the broken the build is responsible for the initial investigation.

#### Use Jenkins status/reaction smart (S)
Split the failing execution into categories related to the root cause hence also who should take action. The minimum split is between DevOps system issue versus domain software (robot software) and let Jenkins adaptively figure out who is first level responsible for the investigation. Do not let DevOps investigate domain problems and visa-versa.

#### Implement bi-sect to determine root cause commit (C)
Implement bi-sect logic to help determine the root cause commit in case there are several commits stacked for longer verification. Let the system determine the best candidate for investigation if there are multiple developer's commits in delta from last success.

### No toll gate to trunk
As it stands today, developers integrate their changes into trunk and then wait to see if they broke anything.
You want to reverse this, as it causes many issues in the day-to-day life of your developers.
These range from obvious halted team progress by broken trunks to the more insidious ingraining of bad developer habits.

#### All changes are done on branches (M)
When you start working on a new task, branch off to isolate your changes, then prune your history before delivering.
From this point onward, the integration of your changes into trunk and the remainder of pipeline are fully automated.

#### Define and implement the toll gate criteria (M)
Define your toll gate criteria. These are quality requirements **all** code changes must meet to make it into trunk.
**Nothing else**.

It could be as simple as:

* The changes can be merged
* The merge result compiles on a clean environment
* A specific set of unit tests pass
* A certain amount of code coverage is met
* A small subset of functional tests pass

The pipeline should test **every** change set and verify the definition of done **prior** to merging it into trunk.

In the Git and Jenkins world, the stable integration branch will be merged into the local branch by Jenkins. If this goes well, the other steps of the toll gate are then executed. When all these pass, Jenkins will push the merge back to the remote and update the integration branch.

#### Changes to trunk initiate pipeline (S)
The pipeline, the automated implementation of your _Definition of Done_, should start automatically when changes make it through the toll gate and into trunk. As the code passes more rigorous testing, it is **promoted**. These promotions can happen at several places throughout the pipeline, marking the code with higher levels of confidence.

### Running E2E tests too early
The developers are running end to end tests prior to integrating to main line. The issue is exacerbated, because the E2E tests are executed in the pipeline delaying basic feedback of earlier steps.

#### Run the critical functional tests after mocks and stubs (C)
Critical is hard to define. It is different from system to system and from release to release. But there are some guidelines for helping to determine this.

* Which code parts are the most complex
* Which code parts have generated the most defects when change
* Which functionality is absolutely critical
* Which code parts are changed the most

What we want to do here is to scale the tests to give the most value while keeping an acceptable feedback time.



### Pipeline definition are separate from code repositories
The pipeline definitions are not stored along with the (component/subsystem/system) domain software. It gives problems as it is unclear what is the definition-of-done(DoD) and the definition-of-done-done (DoDD). Who defines this? The DevOps engineer or the team?

#### Separate the concerns of infrastructure and process (M)
The DevOps are the architects of the overall system. Their perspective is to maintain the infrastructure (Jenkins, nodes etc), and by that delivering an architecture, execution service and interface to the development teams on which they execute their definition of done.

We suggest that the CI master(s) configuration (including plugins) and agents is driven by DevOps. The seed jobs(Job DSL) contains a reference to which pipeline script to run. Pipeline scripts are stored in the domain repository.

#### DevOps provides framework (C)
A good approach, from a DevOps perspective, is to provide the parts(framework) that are needed by most/all pipelines. This could be things like how long to keep artifacts, builds, etc which relates to the infrastructure and overall system concerns.

#### Domain specific configuration lives with the source code (C)
The domain specific configuration should be managed by domain repositories.
The pipeline definition/configuration that are not directly related to infrastructure and overall system concerns is handled in the domain repository. Ideally it is the 'process' steps and the domain specific parts.




