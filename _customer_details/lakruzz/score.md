---
# lines are split into 0 line chunks
# for easy finding matching pairs

scores:

  # arch
  #                                       T F P C
  code-metrics:                           0 0 0 0
  testable-code:                          0 0 0 0
  dependencies-are-managed:               0 0 0 0
  individually-releasable-components:     0 0 0 0
  full-audit-trail:                       0 0 0 0
  interface-as-code:                      0 0 0 0

  # build
  #                                       T F P S
  automated-builds:                       2 3 2 2
  artifacts-are-managed:                  2 2 2 3
  automated-release-notes:                3 2 0 1
  full-trace:                             0 0 0 0
  delivery-pipeline:                      0 0 0 0

  # devops
  #                                       T F P S
  one-team:                               0 0 0 0
  automated-deployment:                   0 0 0 0
  on-demand-environments:                 0 0 0 0
  infrastructure-as-code:                 0 0 0 0
  live-monitoring-and-feedback:           0 0 0 0

  # org
  #                                       T F P S
  agile-process:                          0 0 0 0
  buy-in-management:                      0 0 0 0
  tasks-are-groomed:                      0 0 0 0
  designated-roles:                       0 0 0 0
  knowledge-transfer:                     0 0 0 0

  # qa
  #                                       T F P S
  unit-test:                              0 0 0 0
  automated-functional-tests:             0 0 0 0
  maintain-test-data:                     0 0 0 0
  adaptive-test-suites:                   0 0 0 0
  test-in-production:                     0 0 0 0

  # vcs
  #                                       T F P S
  commits-are-tied-to-tasks:              0 0 0 0
  release-train-branching-strategy:       0 0 0 0
  version-numbers:                        0 0 0 0
  use-dvcs:                               0 0 0 0
  pristine-integration-branch:            0 0 0 0

---
