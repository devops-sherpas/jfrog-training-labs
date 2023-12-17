# Demo: IDE Plugin

## Prerequisites

Apply the attached Terraform module (`main.tf`).

This will create a project with the ID `idedemo`, and a policy and a watch attached to it.

The policy is set to trigger only when there are critical vulnerabilities.

## Progress

Open Visual Studio Code and open the folder containing this repository.

In the JFrog extension settings, populate the JFrog project key (`idedemo`).

Then, in the JFrog extension window, click the "Refresh" button.

You should see that only critical vulnerabilities are reported.
