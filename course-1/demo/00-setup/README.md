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

4. Install Visual Studio Code.
5. Start Visual Studio Code, and install the JFrog extension.
6. Once installed, configure the JFrog extension to point at your JFrog environment.
7. Install Docker.
8. Ensure that Xray is enabled and working ("Xray" -> "Settings" -> "Advanced"/"Settings" -> "Xray Enabled").
9. Create a Docker repository called `docker-dev-local`, and ensure it is indexed by Xray.
