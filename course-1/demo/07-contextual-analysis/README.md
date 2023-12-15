# Demo: Contextual Analysis

Build & tag the docker image of the attached NodeJS app (replace `<ARTIFACTORY_HOST>` with the hostname
of your Artifactory instance):

```bash
cd js
docker build -t js-demo .
docker tag js-demo <ARTIFACTORY_HOST>/docker-dev-local/js-demo:latest
```

Log in to Docker (provide your username & access token):

```bash
docker login <ARTIFACTORY_HOST>
```

Push to the Docker repository:

```bash
docker push train23lom01.jfrog.io/docker-dev-local/js-demo:latest
```

Then navigate to Xray's Scans List, and select the docker image you just uploaded.
At the top right, click "Scan for Contextual Analysis".
After a while, you should see the full scan results.
