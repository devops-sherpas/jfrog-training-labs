# Lab: Configure push/pull replication

In this lab, we will configure push and pull replications and witness them at work.

## Prerequisites

You should have access to two Artifactory instances; we will refer to them as "site A" and "site B", with the base
URL's being `http://artifactory-site-a` and `http://artifactory-site-b`, respectively.

On your machine, you should ensure that the following properties are defined in your Maven `settings.xml` file:

* `artifactoryRoot`, containing the URL of site A.
* `artifactoryUser`, containing your username.
* `artifactoryPassword`, containing your password.

You may set these properties in the main configuration, or in a Maven profile configuration - that's up to you; however,
if you set them in a Maven profile, you'll need to activate that profile when running the Maven commands below (use the `-P`
command line switch).

## Lab progress

1. Log in to site B, and define a local Maven repository on it. Call it repository `maven-dev-site-a`.
2. Log in to site A, and define a local Maven repository on it.
   1. Call the repository `maven-dev-local`.
   2. Switch to the "Replications" tab
   3. In the Cron Expression field, type some cron value (such as `0 0 12 * * ?`).
   4. Check the "Enable Event Replication" checkbox.
   5. Click "Add Replication".
   6. In the URL field, type the URL of the repository you created on site B: `http://artifactory-site-b/artifactory/maven-dev-site-a`.
   7. In the "username" and "password" fields, enter your credentials for site B.
   8. Click the "Test" button to ensure that connection can be established.
   9. Click "Save".
3. On your file system, from a command prompt, navigate to the [java](java) directory.
4. Build and deploy the artifact to Site A:
   ```bash
   mvn clean deploy -Drepository=maven-dev-local
   ```
5. Ensure your artifact exists in site A.
6. Check the `maven-dev-site-a` repository on site B. You should see your artifact there.
