# Lab: Generate a RBv2 + Distribution

In this lab, we will generate a RBv2 and use Distribution to distribute it to an edge node.

## Prerequisites

1. You should have access to one Artifactory instance, and one edge instance; we will refer to them as "master" and "edge",
with the base URL's being `http://master` and `http://edge`, respectively.
2. This lab assumes that you completed the previous lab, hence you should have an artifact already deployed
3. You should have GPG installed on your machine.

## Lab progress

1. Create a GPG keypair:

```bash
gpg --batch --generate-key keypair.txt
gpg --output public.asc --armor --export "Test Lab"
gpg --output private.asc --armor --export-secret-keys "Test Lab"
```

2. Upload your keypair to Artifactory:
   1. From the "Administration" panel, select "Artifactory" -> "Keys Management".
   2. Under "Signing Keys", click "Add Keys" and then "GPG Keys".
   3. In the "Name" field, type `main`.
   4. In the "Alias" field, type `main`.
   5. Either paste or drag & drop the private and public key files into their respective input boxes.
   6. Clear the "Pass Phrase" field.
   7. Click the "Add GPG Key" button.

3. Under "Artifactory" -> "Builds", click the `ExampleWAR` build.
4. Select any build ID from the list (you should have at least one).
5. In the top right, click "Create Release Bundle".
   1. In the "Release Bundle Name" field, type `lab-rb`.
   2. In the "Release Bundle Version" field, type `1.0`.
   3. In the "Signing Key" dropdown, select the keypair we had just defined.