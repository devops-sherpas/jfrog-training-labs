# Lab: Artifactory Basics

In this lab, we will experiment with uploading and downloading artifacts using the UI, the
CLI, and the REST API.

We will also experiment with setting properties, as well as querying for artifacts using AQL
and GraphQL.

## Prerequisites

* Ensure that you have a JFrog CLI profile pointing to your Artifactory instance, and ensure
that it is the active profile (`jf config use`).

## Progress

1. Log in to Artifactory.
2. Create a repository. Choose the type "generic", and provide it with a name, such as `lab-01-repo`.
3. Create a sample text file on your local machine, such as `test.txt`.

### Upload / Download Using the UI

1. Navigate to the artifacts browser ("Artifactory" -> "Artifacts"), and focus on your new repository.
1. Click the "Deploy" button at the top right.
1. Drag and drop your text file into the "Single Deploy" box.
1. Click the "Deploy" button.
1. Once the file is uploaded, navigate to it using the navigation bar on the left and focus on it.
1. Click the "Download" button on the top right (a downward pointing arrow) and download the file.
1. Delete the artifact from the repository. Click the button with the three vertical dots and select "Delete".

### Upload / Download Using the CLI

1. Open a command-line window, and browse to the directory containing your file.
1. Upload the file to the repository using the JFrog CLI:
   ```bash
   jf jf rt upload test.txt lab-01-repo/
   ```
1. Delete the file from your local machine.
1. Download the file from the repository into your local machine:
   ```bash
   jf rt download lab-01-demo/test.txt .
   ```
1. Delete the file from the repository.

### Upload / Download Using the REST API

1. Upload the file again using the REST API:
   ```bash
   curl -X PUT -u <username>:<password> -d "@test.txt" <artifactory-url>/artifactory/lab-01-repo/test.txt
   ```
1. Delete the file from your local machine.
1. Download the file using the REST API:
   ```bash
   curl -u <username>:<password> <artifactory-url>/artifactory/lab-01-repo/test.txt
   ```
