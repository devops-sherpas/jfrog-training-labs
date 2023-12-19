# Lab: Generate a RBv2 + Distribution

In this lab, we will generate a RBv2 and use Distribution to distribute it to an edge node.

## Prerequisites

This lab assumes that you completed the previous lab, hence you should have a build already deployed.

## Lab progress

1. Navigate to the build you had created in the previous lab ("Artifactory" -> "Builds").
2. Click "Create Release Bundle" at the top right.
3. Provide a name and a version to the release bundle.
4. Click "Next", and then "Create".
5. Navigate to your release bundle ("Artifactory" -> "Releast Bundles v2" -> `example-repl`).
6. Hover over the version you would like to distribute, click the three dots to the right, and select "Distribute".
7. Select the target Artifactory Edge instance, as well as "Auto create missing repositories".
8. Click "Distribute".
9. From the "Actions Tracking" tab, follow the distribution's progress.
