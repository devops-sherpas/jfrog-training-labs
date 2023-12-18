# Demo: Build Info Creation, RBv2 Creation, RBv2 Promotion

## Creating Build Info

1. Navigate to the [shared Java project](../../../common/java).
2. Create a new build configuration:
   ```bash
   jf mvnc --repo-deploy-releases maven-c02-dev-local --repo-deploy-snapshots maven-c02-dev-local
   ```
3. Build and deploy:
   ```bash
   jf mvn clean deploy --build-name c02-example --build-number 1
   ```
4. Publish the build info:
   ```bash
   jf rt bp c02-example 1
   ```

Once published, you can see the new build in the "Builds" panel.

## Creating RBv2

1. In the "Builds" panel, navigate to the build `c02-example`, then number `1`.
2. Click the "Create Release Bundle" button.
   1. Release bundle name: `c02-example-rb`
   2. Release bundle version: `1.0`
   3. Signing Key: `main`
   4. Click "Next" and then "Create".

You'll be automatically redirected to the "Release Bundles v2" screen.

Select `c02-example-rb`, and then `1.0`, and ensure that the bundle's creation status is `Success`.

## Promoting RBv2

1. Click the "Promote" button at the top right.
2. Select `PROD` as the target environment.
3. Click "Next".
4. Ensure that only `maven-c02-prod-local` is populated in "Target Repositories". Click the dropdown's down-pointing
   arrow to make sure.
5. Click "Promote".
6. Shortly after, the row showing the `Promotion` action should be in `Success` status.
