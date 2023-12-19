# Lab: Artifactory Basics

In this lab, we will experiment with uploading and downloading artifacts using the UI, the
CLI, and the REST API.

We will also experiment with setting properties, as well as querying for artifacts using AQL
and GraphQL.

## Progress

### Upload / Download Using the UI

1. Create a sample text file on your local machine, such as `test.txt`.
2. Navigate to the artifacts browser ("Artifactory" -> "Artifacts"), and focus on your new repository.
3. Click the "Deploy" button at the top right.
4. Drag and drop your text file into the "Single Deploy" box.
5. Click the "Deploy" button.
6. Once the file is uploaded, navigate to it using the navigation bar on the left and focus on it.
7. Click the "Download" button on the top right (a downward pointing arrow) and download the file.
8. Delete the artifact from the repository. Click the button with the three vertical dots and select "Delete".

### Upload / Download Using the CLI

1. Open a command-line window, and browse to the directory containing your file.
2. Upload the file to the repository using the JFrog CLI:
   ```bash
   jf jf rt upload test.txt generic-lab-local/
   ```
3. Delete the file from your local machine.
4. Download the file from the repository into your local machine:
   ```bash
   jf rt download generic-lab-local/test.txt .
   ```
5. Delete the file from the repository.

### Upload / Download Using the REST API

1. Upload the file again using the REST API:
   ```bash
   curl -X PUT -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@test.txt" $JFROG_URL/artifactory/generic-lab-local/test.txt
   ```
2. Delete the file from your local machine.
3. Download the file using the REST API:
   ```bash
   curl -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" $JFROG_URL/artifactory/generic-lab-local/test.txt
   ```
