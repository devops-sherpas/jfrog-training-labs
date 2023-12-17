# Demo: Scanning BOM's

1. Ensure that Xray is configured to scan all builds. In Xray's administration, click "Indexed Resources" and
   add all current and future builds (using a pattern: `**`).
2. Navigate to the [common Java project](../../../common/java).
3. Prepare it for a build, and then build it:
   ```bash
   jf mvnc --repo-deploy-releases maven-dev-local --repo-deploy-snapshots maven-dev-local
   jf mvn clean deploy --build-name bom-scan-example --build-number 1
   ```
4. Push the build info to Artifactory:
   ```bash
   jf rt bp bom-scan-example 1
   ```
5. Navigate to Xray's scans list, and watch the build scanning results there.
