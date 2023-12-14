# Course 1 Demo Setup

1. Follow the [common prerequisites](../../../README.md#common-prerequisites) section.
2. Create repositories:
   ```bash
   jf rt repo-create generic-basics-demo-local.json
   ```

3. Create a signing key pair:
   ```bash
   curl -u %RT_USERNAME%:%RT_TOKEN% -X POST -d "@create-keypair.json" -H "Content-Type: application/json" %RT_URL%/artifactory/api/security/keypair
   ```

4. Install IntelliJ IDEA (Community Edition is sufficient).
5. Start IntelliJ IDEA and install the JFrog plugin.
6. In IntelliJ IDEA's Settings dialog, navigate to "Other Settings" -> "JFrog Global Configuration".
   1. Under "Connection Details", set your JFrog Platform URL.
   2. For "Authentication method", select "Access token" and paste your identity token into the "Access token" field.
   3. Click "Test connection" to verify.
