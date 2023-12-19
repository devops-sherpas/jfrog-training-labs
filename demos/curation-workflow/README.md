# Demo: Curation

1. Ensure that Curation is enabled ("Administration" -> "Curation" -> "General" -> "Curation Service Activation").
2. Under "Administration" -> "Curation" -> "Curated Repositories", click the "State" toggle next to `docker-hub-demo-remote`
   and `maven-central-demo-remote` so they become enabled.
3. Switch to the "Application" sidebar, and navigate to "Curation" -> "Policies Management", and click "Create New Policy".
   1. Policy Name: `curation-demo`
   2. Repositories: "All Curated"
   3. Policy Condition: "CVE with CVSS score of 9 or above (with or without a fix)".
   4. Waivers: None (just click "Next").
   5. Actions: "Dry run". Also select "Notify by Email" and enter your email address.
   6. Click "Next", and then "Save Policy".
4. Ensure that your machine doesn't have Log4J cached in your local Maven repository:
   1. Navigate to `~/.m2/repository`
   2. Delete the entire `org/apache/logging` directory tree, if it exists.
5. On your own machine, using a command prompt, navigate to the [common Java module](../../common/java).
6. Prepare it for a build so it resolves artifacts from `maven-demo-virtual`, and then try to build it:
   ```bash
   jf mvnc --repo-resolve-releases maven-demo-virtual --repo-resolve-snapshots maven-demo-virtual
   jf mvn clean package
   ```

   The build with end OK, but you should get an email alerting you of a violation. That's because a vulnerable Log4J
   artifact is defined as a dependency in our POM.
7. Delete the cache of Log4J from your local Maven repository (same instructions above).
8. Change the curation policy's action to "Block" (instead of "Dry run").
9. Delete Log4J from the remote repository's cache (`maven-central-demo-remote-cache`).
10. Repeat the steps to prepare the Java build, and run it. You should see that the build ends with HTTP code 403.
11. From the "Application" sidebar, navigate to "Curation" -> "Overview". You should see that one curated repository
    had a security incident.
12. Navigate to "Curation" -> "Audit". You should see the blocked action there.
