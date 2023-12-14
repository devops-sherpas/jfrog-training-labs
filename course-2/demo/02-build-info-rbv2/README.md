# Demo: Build Info Creation, RBv2 Creation, RBv2 Promotion

## Creating Build Info

1. Navigate to the [shared Java project](../../../common/java).
2. Create a new build configuration:
   ```bash
   jf mvnc --repo-deploy-releases maven-dev-local --repo-deploy-snapshots maven-dev-local
   ```
3. Build and deploy:
   ```bash
   jf mvn clean deploy --build-name example --build-number 1
   ```
4. Publish the build info:
   ```bash
   jf rt bp example 1
   ```

Once published, you can see the new build in the "Builds" panel.

## Creating RBv2

1. In the "Builds" panel, navigate to a specific build.
2. Click the "Create Release Bundle" button.
   1. Release bundle name: `example-rb`
   2. Release bundle version: `1.0`
   3. Signing Key: `main`
   4. Click "Next" and then "Create".

## Promoting RBv2

