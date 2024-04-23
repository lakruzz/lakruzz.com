---
# lines are split into 0 line chunks
# for easy finding matching pairs

scores:

  # arch
  #                                       T F P S
  code-metrics:                           2 3 3 2
  testable-code:                          2 3 3 1
  dependencies-are-managed:               3 3 2 2
  individually-releasable-components:     2 2 3 2
  full-audit-trail:                       1 3 1 2
  interface-as-code:                      0 0 0 0

  # build
  #                                       T F P S
  automated-builds:                       2 1 2 2
  artifacts-are-managed:                  2 2 2 1
  automated-release-notes:                2 1 0 3
  full-trace:                             1 3 2 1
  delivery-pipeline:                      3 3 3 1

  # devops
  #                                       T F P S
  one-team:                               3 3 1 2
  automated-deployment:                   1 3 2 2
  on-demand-environments:                 3 1 2 2
  infrastructure-as-code:                 1 2 1 2
  live-monitoring-and-feedback:           2 3 2 1

  # org
  #                                       T F P S
  agile-process:                          2 2 2 2
  buy-in-management:                      3 3 2 3
  tasks-are-groomed:                      3 1 3 1
  designated-roles:                       2 2 2 2
  knowledge-transfer:                     3 3 3 1

  # qa
  #                                       T F P S
  unit-test:                              2 3 2 2
  automated-functional-tests:             3 2 1 2
  maintain-test-data:                     2 1 1 3
  adaptive-test-suites:                   3 1 1 1
  test-in-production:                     0 3 1 2

  # vcs
  #                                       T F P S
  commits-are-tied-to-task:               1 2 0 3
  release-train-branching-strategy:       3 2 1 3
  version-numbers:                        0 2 1 2
  use-dvcs:                               3 2 1 1
  pristine-integration-branch:            2 2 3 3

---
