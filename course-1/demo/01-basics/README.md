# Demo: Artifactory Basics

## Uploading using CLI

```bash
jf rt upload test.txt generic-demo-local/
```

## Downloading using CLI

```bash
jf rt download generic-demo-local/test.txt .
```

## Uploading using REST API

```bash
curl -X PUT -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@test.txt" $JFROG_URL/artifactory/generic-demo-local/test.txt
```

## Downloading using REST API

```bash
curl -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" $JFROG_URL/artifactory/generic-demo-local/test.txt
```

## Setting properties through CLI

```bash
jf rt sp generic-demo-local/test.txt key1=value1
```

## Setting properties through REST API

```bash
curl -X PUT -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" $JFROG_URL/artifactory/api/storage/generic-demo-local/test.txt?properties=key2=value2
```

## Query via filespec & AQL (CLI)

```bash
jf rt s --spec=query-aql-cli.json
```

## Query via AQL (REST API)

```bash
curl -X POST -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@query-aql-rest.txt" -H "Content-Type: text/plain" $JFROG_URL/artifactory/api/search/aql
```

## Query via GraphQL

```bash
curl -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -X POST $JFROG_URL/metadata/api/v1/query -d "@query-graphql.json"
```
