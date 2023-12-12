# Lab: Creation of Repositories

In this lab, we will experiment with creating repositories via the UI, API, and CLI


## Prerequisites

* Ensure that you have a JFrog CLI profile pointing to your Artifactory instance, and ensure
that it is the active profile (`jf config use`).
To setup a JFrog configuration CLI profile use:
   ```bash
   jf config add <URL> --user <username> --password <password or token>
   ```


### Create Repositories using the UI
1. Create a local repository and give it a name (e.g. lab-local-repo).
2. Create a remote repository and give it a name (e.g. lab-remote-repo) you can use the default URL for the remote (make sure to test connection).
3. Create a virtual repository. Include both the local and remote repositories in it.
