# Demo: Curation Introduction

1. Ensure that Curation is enabled ("Administration" -> "Curation" -> "General" -> "Curation Service Activation").
2. Under "Administration" -> "Curation" -> "Curated Repositories", click the "State" toggle next to `npm-demo-remote`
   so it becomes curated.
3. Switch to the "Application" sidebar, and navigate to "Curation" -> "Policies Management", and click "Create New Policy".
   1. Policy Name: `curation-intro-demo`
   2. Repositories: "Specific", and then select `npm-demo-remote`.
   3. Policy Condition: "Malicious package".
   4. Waivers: None (just click "Next").
   5. Actions: "Block". Also select "Notify by Email" and enter your email address.
   6. Click "Next", and then "Save Policy".
4. On your own machine, using the command prompt, navigate to the [common NodeJS module](../../common/js).
5. Set the project's `npm` configuration to resolve packages from Artifactory:
   ```bash
   npm config set registry $JFROG_URL/artifactory/api/npm/npm-demo-virtual/ --location project
   ```
6. Use Artifactory's REST API to obtain your encoded NPM credentials:
   ```bash
   curl -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" $JFROG_URL/artifactory/api/npm/auth
   ```
7. Edit `.npmrc` in the current directory, and append the output of the last step to it. Save and exit.
8. Try downloading a malicious package, such as `cors.js`:
   ```bash
   npm install cors.js
   ```
   The installation should fail on HTTP 403. You should also receive an email to that effect.
9. Navigate to "Curation" -> "Audit". You should see the blocked action there.
