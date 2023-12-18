# JFrog Training Labs

## Common Prerequisites

There are certain prerequisites which are common to most (or all) of the labs:

### Environment Variables

Most `curl` commands will require your Artifactory URL, username, password, and (sometimes) token:

* `RT_URL`: should be set to your Artifactory URL
* `RT_USERNAME`: should be set to your username
* `RT_PASSWORD`: should be set to your password
* `RT_TOKEN`: should be set to an identity token that you create

To create an identity token, navigate to your profile (top right corner, click "Edit Profile"),
unlock the screen by providing your password, and then "Generate Identity Token".

### CLI and CLI Profile

Some labs require using the CLI.

To install the CLI: https://jfrog.com/getcli/

Once the CLI is installed, you should create a profile that points to your Artifactory instance.
You can define a CLI profile using a command such as:

```bash
jf config add train --url http://my-artifactory.jfrog.io --user <your-username> --password <your-password> --access-token <your-token>
```

* `train` is the profile's name. You can use any name you like.
* `http://my-artifactory.jfrog.io` should be replaced with your Artifactory instance's URL.
* `your-username` should be your username.
* `your-password` should be your password.
* `your-token` should be an identity token that you create for yourself. Instructions for creating an identity token
  are provided above (under [Environment Variables](#environment-variables)).

To use this profile:

```bash
jf config use train
```

### IDE

1. Install Visual Studio Code.
2. Install the JFrog Extension.
3. Configure the JFrog Extension by having it connect to your JFrog environment.
   1. If you properly installed the CLI already, then your CLI profile should be automatically detected by the IDE extension
      and you will be prompted accordingly.

### Docker

Certain demos and labs require Docker to be installed.

On Windows, install Docker Desktop for Windows.
On Linux, install Docker via your distribution's package manager.

### Terraform

You should have Terraform installed on your machine.
Download and extract Terraform from HashiCorp's website.
