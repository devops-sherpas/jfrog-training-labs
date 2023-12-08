# Lab: Configure push/pull replication

In this lab, we will configure push and pull replications and witness them at work.

## Prerequisites

You should have access to two Artifactory instances; we will refer to them as "site A" and "site B", with the base
URL's being `http://artifactory-site-a` and `http://artifactory-site-b`, respectively.

## Lab progress

1. Log in to site B, and define a local Maven repository on it.
   a. call the repository `maven-dev-site-a`.
2. Log in to site A, and define a local Maven repository on it.
   a. Call the repository `maven-dev-local`.
   b. Switch to the "Replications" tab
   c. In the Cron Expression field, type some cron value (such as `0 0 12 * * ?`).
   d. Check the "Enable Event Replication" checkbox.
   e. Click "Add Replication".
   f. In the URL field, type the URL of the repository you created on site B: `http://artifactory-site-b/artifactory/maven-dev-site-a`.
   g. In the "username" and "password" fields, enter your credentials for site B.
   h. Click the "Test" button to ensure that connection can be established.
   i. Click "Save".
3. Upload an artifact to `maven-dev-local` on site A.
4. Check the `maven-dev-site-a` repository on site B. You should see your artifact there.

