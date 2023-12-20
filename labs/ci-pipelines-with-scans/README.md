# Lab: CI Pipelines with Scans

Your task is to write a script that simulates a CI pipeline, and uses the JFrog CLI:

* `jf audit` before the build
* The actual build commands (such as `mvn package` or `npm pack`)
* `jf scan` or `jf docker-scan` after the build
