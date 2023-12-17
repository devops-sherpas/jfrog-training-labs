# Lab: Switch to JFrog Projects

In this lab, we will implement the switch to JFrog projects.

Our starting point will be an Artifactory environment with no projects at all.

## Initialization

First, we will need to initialize our Artifactory environment to our starting point: a "flat" Artifactory
environment, with no projects at all.

To achieve this, apply the `main.tf` Terraform module.

## Progress

After running the initialization script, Artifactory contains resources for two teams: `team1` and `team2`.

### Creating the projects

We will start by creating a project for each team:

1. From "Administration" -> "Projects", click the "Create New" button.
   1. Project Name: `Team 1`
   2. Project Key: `team1`
   3. Under "Project Admins", switch to "Groups" and select `team1-admins`.
   4. Click "Create".
2. Repeat the steps above for `Team 2` (use `team2-admins` as project admins).

### Adding members

1. Switch to the `Team 1` project.
2. On the left navigation bar, navigate to "User Management" -> "Roles".
3. Click "Create Project Role".
   1. Role Name: `Developers`
   2. Environments: Ensure only `DEV` exists under "Global Environments".
   3. Actions: Read Artifact, Write Artifact, Delete Artifact.
   4. Click "Create".
4. Click "Create Project Role" again.
   1. Role Name: `Release Engineers`
   2. Environments: `DEV`, `PROD`
   3. Actions: Read Artifact, Write Artifact, Delete Artifact, Promote Release Bundle
5. From the left navigation bar, nagivate to "User Management" -> "Members".
6. Click "Add Members".
7. Add the `team1-developers` group to the `Developers` role.
8. Add the `team1-release-engineers` group to the `Release Engineers` role.

Repeat the steps above for `Team 2`.

### Assigning Repositories

1. Switch to the `Team 1` project.
2. On the left nagivation bar, navigate to "Repositories".
3. Click the "Assign Repositories" button.
4. In the search box, type `team1`. Select all repositories that begin with `team1` and click
   "Assign to Project".
5. Click the "Assign Repositories" button again, and assign the `team1-maven-central-remote` repository to the project.
6. Navigate to the Remote Repositories view, and from the Actions column, select "Share".
   Select "Auto share with all projects" and click "Save".

Repeat the steps above for `Team2`, with the exception of assigning & sharing of the `team1-maven-central-remote` repository.

### Update Permission Targets

Since we are using role-based access control now, we have no use for the original permission targets, so you
can delete them:

* Leave the project-focused view (select "All" from the dropdown in the top left).
* Navigate to "User Management" -> "Permissions".
* Delete all permission targets that begin with `team1` and `team2`.
