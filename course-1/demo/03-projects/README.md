# Demo: JFrog Projects

## Process

### Creating a project and sharing a repository

1. Create a project called `PROJ1` with the ID `prj1`. 
2. Create a project called `PROJ2` with the ID `prj2`.
3. Inside the `PROJ1` project, create a remote repository of type Maven, call it `prj1-maven-central-remote`.
4. In the repositories' list, hover over "Actions" and select "Share".
5. Select "Auto share with all projects" and click "Save".
6. Set the active project in the UI to `PROJ2`.
7. Browse for repositories, and see the `prj1-maven-central-remote` repository there (shared from `PROJ1`).

### Create Build Info

1. In `PROJ1`, create a Maven repository called `prj1-maven-dev-local`.
2. Navigate to [shared Java project directory](../../../common/java).
3. Create build configuration:

   ```bash
   jf mvnc --repo-deploy-releases prj1-maven-dev-local --repo-deploy-snapshots prj1-maven-dev-local
   ```

4. Build & deploy:

   ```bash
   jf mvn clean deploy --build-name example-projects-demo --build-number 1 --project prj1
   ```

5. Push the build info to Artifactory:

   ```bash
   jf rt bp example-projects-demo 1 --project prj1
   ```

Then, navigate to the "Builds" screen within the context of the project.
You should see the build there.

### Create RBv2

Once selecting your build, click "Create Release Bundle" and follow the instructions.
