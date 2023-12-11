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
