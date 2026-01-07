---
---

### No to low usage of code metrics

SonarQube was presented as the *only* code metrics tool implemented, but it reported so many findings that it's hardly used due to too much noise. 
This is also in connection with your efforts in code reviews.
Let all the machines do the hard work of checking the syntax of the code and let the reviews focus on the semantics.

#### Implement SonarQube as a gate for Java and C/C++ (M)

You already have SonarQube and it can supply a lot of inspection and metrics of your code. It also supports many of the commonly used programming languages.
Ideally, you could use it as a gate maintaining thresholds of technical dept, e.g. stop commits that add compiler warnings.
This would automatically catch many issues that are currently resolved in your code reviews.

#### Investigate the landscape of metrics for your languages and binaries (S)

SonarQube alone probably doesn't gather all the metrics you are interested in.
Set up useful quality metrics for the remaining languages (including VHDL) you use.
Also consider running code coverage or other useful metrics on your _tests_.