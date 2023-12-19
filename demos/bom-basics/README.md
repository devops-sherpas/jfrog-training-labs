# Demo: JFrog BOM

## Process

### Create build info

1. Navigate to [shared Java project directory](../../common/java).
2. Create build configuration:

   ```bash
   jf mvnc --repo-deploy-releases maven-c01-dev-local --repo-deploy-snapshots maven-c01-dev-local
   ```

3. Build & deploy:

   ```bash
   jf mvn clean deploy --build-name bom-demo-example --build-number 1
   ```

4. Push the build info to Artifactory:

   ```bash
   jf rt bp bom-demo-example 1
   ```

Then, navigate to "Artifactory" -> "Builds", and show `bom-demo-example` and its build (`1`).

### Create RBv2

From the build's screen in Artifactory, click "Create Release Bundle".

* Release Bundle Name: `bom-demo-example`
* Release Bundle Version: `1.0`
* Signing Key: `main`

Click "Next", then "Create".

### Promote RBv2

After navigating to the RBv2's screen, click "Promote".

* For Signing Key, select `main`.
* For Target Environment, select `PROD`.

Click "Next", ensure that the "Target Repositories" for Maven artifacts is set properly, and click "Promote".
