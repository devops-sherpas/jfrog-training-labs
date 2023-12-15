# Lab: Configure Push/Pull Replications

In this lab, we will configure push and pull replications and witness them at work.

## Prerequisites

You will need the Artifactory URL of your secondary Artifactory instance.

For documentation purposes:

* The URL of your main Artifactory instance would be `http://artifactory-site-a`.
* The URL of your secondary Artifactory instance would be `http://artifactory-site-b`.

## Lab progress

### Push Replication

1. Log in to site B, and define a local Maven repository on it. Call it `maven-repl-lab-push-site-a`.
2. Log in to site A, and define a local Maven repository on it.
   1. Call the repository `maven-repl-lab-push-local`.
   2. Switch to the "Replications" tab.
   3. In the Cron Expression field, type some cron value (such as `0 0 12 * * ?`).
   4. Check the "Enable Event Replication" checkbox.
   5. Click "Add Replication".
   6. In the URL field, type the URL of the repository you created on site B: `http://artifactory-site-b/artifactory/maven-repl-lab-push-site-a`.
   7. In the "username" and "password" fields, enter your credentials for site B.
   8. Click the "Test" button to ensure that connection can be established.
   9. Click "Save".
3. On your file system, from a command prompt, navigate to the [java](../../common/java) directory in this repository's root.
4. Prepare, build and deploy the artifact to Site A:
   ```bash
   jf mvnc --repo-deploy-releases maven-repl-lab-push-local --repo-deploy-snapshots maven-repl-lab-push-local
   jf mvn clean deploy --build-name example-repl --build-number 1
   jf rt bp example-repl 1
   ```
5. Ensure your artifact exists in site A.
6. Check the `maven-repl-lab-push-site-a` repository on site B. You should see your artifact there.

### Pull Replication

1. Log in to site A, and define a local Maven repository on it, called `maven-repl-lab-pull-local`.
2. Log in to site B, and define a remote Maven repository on it.
   1. Call the repository `maven-repl-lab-pull-site-a`.
   2. In the URL field, enter the URL of the repository on site A: `http://artifactory-site-a/artifactory/maven-repl-lab-pull-local`
   3. Provide the username and password/token for site A.
   4. Click the "Test" button to ensure your parameters are correct.
   5. Switch to the "Replications" tab.
   6. Check the "Enable Active Replication of This Repository" box.
   7. In the Cron Expression field, type some cron value (such as `0 0 12 * * ?`).
   8. Check the "Enable Event Replication" box.
   9. Click the "Test" button.
   10. Click "Save".
3. On your file system, from a command prompt, navigate to the [java](../../common/java) directory in this repository's root.
4. Prepare, build and deploy the artifact to Site A:
   ```bash
   jf mvnc --repo-deploy-releases maven-repl-lab-pull-local --repo-deploy-snapshots maven-repl-lab-pull-local
   jf mvn clean deploy --build-name example-repl --build-number 2
   jf rt bp example-repl 2
   ```
5. Ensure your artifact exists in site A.
6. Check the `maven-repl-lab-pull-site-a` repository on site B. You should see your artifact there.
