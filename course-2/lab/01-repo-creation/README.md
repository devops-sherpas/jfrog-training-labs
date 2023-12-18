# Lab: Repository Creation

In this lab, we will practice the creation of repositories, using the UI, the API, the CLI, and finally - using
JFrog's Terraform provider.

## Progress

### Using the UI

1. Log into your Artifactory instance.
2. From the "Administration" navigation bar, select "Repositories" and then "Repositories" underneath it.
3. Click "Add Repositories", and then "Local Repository".
4. Select a repository type (example: Maven).
5. Fill in the repository's name, as well as any other technology-specific fields (for example: for
   Maven repositories, look for "Maven Settings" at the lower right part of the screen).
6. Click "Create Local Repository".

### Using the CLI

1. Use the repository creation template command to generate a JSON file describing the repository:
   ```bash
   jf rt rpt repository.json
   ```
   This is a command-line "wizard". Use the `tab` key and arrow keys to go through the wizard.
   The only thing you are required to provide is the repository's name, class (local/remote/virtual), and
   package type. Then, you may either continue providing optional information, or end the wizard using `:x`.
2. Look at the generated `repository.json` file. It contains the repository creation parameters.
3. Use the JFrog CLI to create the repository according to the created JSON file:
   ```bash
   jf rt rc repository.json
   ```

### Using the REST API

1. Prepare a JSON file containing the repository information.
   **NOTE**: The JSON structure for the REST API is not identical to the structure consumed by the CLI.
   You can find reference to the REST API's structure at: https://jfrog.com/help/r/jfrog-rest-apis/repository-configuration-json

   1. You can find an example in [repository-api.json](repository-api.json).
   2. We will assume that the file name is `repository-api.json`.

3. Use the REST API to create the repository as follows (substitute `my-repository` with the name of your repository.
   It must be equal to the repository key specified in your JSON):
   ```bash
   curl -X PUT -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@repository-api.json" -H "Content-Type: application/json" $JFROG_URL/artifactory/api/repositories/my-repository
   ```

### Using JFrog's Terraform Provider

An example Terraform module is provided: [repository-create.tf](repository-create.tf).
You should edit it to reflect your desired repository mame or type.

Then, from within this directory:

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Apply the Terraform module, by providing your Artifactory URL, username and access token through
   the command line:

   ```bash
   terraform apply
   ```

   Validate the creation preview and enter `yes` to have the repository created.

3. Destroy the created resource, using the `terraform destroy` command:

   ```bash
   terraform destroy
   ```
