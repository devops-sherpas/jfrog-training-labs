# JFrog Training Labs

## Common Prerequisites

There are certain prerequisites which are common to most (or all) of the demos and labs:

### Xray

Ensure that Xray is enabled and working ("Xray" -> "Settings" -> "Advanced"/"Settings" -> "Xray Enabled").

### Environment Variables

You should have the following environment variables set:

* `JFROG_URL`: should be set to your Artifactory URL.
* `JFROG_ACCESS_TOKEN`: should be set to an access token or an identity token.

To create an identity token, navigate to your profile (top right corner, click "Edit Profile"),
unlock the screen by providing your password, and then "Generate Identity Token".

These environment variables are used throughout the labs & demos.

Also, Terraform templates included in this repository use JFrog's Terraform providers, which consult
these environment variables by default.

### IDE

1. Install Visual Studio Code.
2. Install the JFrog Extension.
3. Configure the JFrog Extension by having it connect to your JFrog environment.
   1. If you properly installed the CLI already, then your CLI profile should be automatically detected by the IDE extension
      and you will be prompted accordingly.
