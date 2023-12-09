# Lab: Federated Repositories

In this lab, we will create federated repositories and witness how they work.

## Prerequisites

You should have access to two Artifactory instances; we will refer to them as "site A" and "site B", with the base
URL's being `http://artifactory-site-a` and `http://artifactory-site-b`, respectively.

## Lab progress

1. Log in to site A and create a federated repository.
   1. Navigate to "Administration" -> "Repositories", then click "Add Repositories" and "Federated Repository".
   2. Select "Maven".
   3. In the "Repository Key" field, type `maven-federated-demo`.
   4. Navigate to the "Federation" tab.
   5. Click "Add Repository".
   6. From the list of deployments, select your secondary site, and then click the "+ Create New" button.
   7. Click "Done", and then "Create Federated Repository".
2. Deploy an artifact to the new federated repository. You can use the same Java project from the first lab, just change
   the repository name in the command line:
   ```bash
   mvn clean deploy -Drepository=maven-federated-demo
   ```
3. Log in to site B, navigate to the `maven-federated-demo` repository in the artifacts browser, and look for the
   artifact that you had just deployed. It has been automatically transferred from site B.
