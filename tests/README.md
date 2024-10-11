# Automating RHTPA Installation Tests

The directory with this README you are just reading contains tests and
infrastructure setup needed to automate the process of verification that
Red Hat Trusted Profile Analyzer v1 is installed on the target machine and it
is working correctly.

The layout of this directory follows the layout of Ansible roles. With this
approach tests can be placed inside playbooks and import this directory as a
role to perform setup, run, and tear down tasks.

## Contents

1. [The Layout](#the-layout)

## The Layout

Inside this directory you can find:
* `containers\`
* `defaults\`
* `files\`
* `tasks\`
  * `infra\`
* `templates\`
  * `infra\`
* `tools\`
* `vars\`

## Requirements

## Running the Tests

### Setting the Infrastructure

### Executing the Tests

### Cleaning Up

## Writing a Test
