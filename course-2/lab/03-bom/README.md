# Lab: Manipulating JFrog BOMs

In this lab, we will practice manipulating BOM's and RBv2's: we will generate a build, then create
an RBv2 from it, and promote it between environments. For RBv2 creation and promotion, we will use the REST API,
in order to demonstrate how to integrate RBv2 functionality from within CI processes.

## Process

### Create build info

1. Navigate to [shared Java project directory](../../../common/java).
2. Create build configuration:

   ```bash
   jf mvnc --repo-deploy-releases maven-bom-lab-dev-local --repo-deploy-snapshots maven-bom-lab-dev-local
   ```

3. Build & deploy:

   ```bash
   jf mvn clean deploy --build-name bom-lab-example --build-number 1
   ```

4. Push the build info to Artifactory:

   ```bash
   jf rt bp bom-lab-example 1
   ```

Then, navigate to "Artifactory" -> "Builds", and see `bom-lab-example` and its build (`1`).

### Create RBv2

Now, let's use the REST API to create an RBv2 from the build.

1. Prepare a JSON file called `payload.json` with the request's payload:
   ```json
   {
     "release_bundle_name": "bom-lab-release-bundle",
     "release_bundle_version": "1.0.0",
     "source_type": "builds",
     "source": {
       "builds": [
         {
           "build_name": "bom-lab-example",
           "build_number": "1"
         }
       ]
     }
   }
   ```

2. Invoke the REST API to create the RBv2:
   ```bash
   curl -X POST -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@payload.json" -H "X-JFrog-Signing-Key-Name: main" $JFROG_URL/lifecycle/api/v2/release_bundle?async=false
   ```

3. Inspect the response to ensure the RBv2 was created successfully.

### Promote RBv2

Now, we'll use the REST API to promote the RBv2 to the DEV environment.

1. Prepare a JSON file called `payload.json` with the request's payload:
   ```json
   {
     "environment": "PROD"
   }
   ```

2. Invoke the REST API to promote the RBv2:
   ```bash
   curl -X POST -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@payload.json" -H "X-JFrog-Signing-Key-Name: main" $JFROG_URL/lifecycle/api/v2/promotion/records/bom-lab-release-bundle/1.0.0?async=false
   ```

3. Inspect the response to ensure the RBv2 was created successfully.
