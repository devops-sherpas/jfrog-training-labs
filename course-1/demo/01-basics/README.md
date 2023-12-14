# Demo: Artifactory Basics

## Uploading using CLI

```bash
jf rt upload test.txt generic-basics-demo-local/
```

## Downloading using CLI

```bash
jf rt download generic-basics-demo-local/test.txt .
```

## Uploading using REST API

```bash
curl -X PUT -u %RT_USERNAME%:%RT_TOKEN% -d "@test.txt" %RT_URL%/artifactory/generic-basics-demo-local/test.txt
```

## Downloading using REST API

```bash
curl -u %RT_USERNAME%:%RT_TOKEN% %RT_URL%/artifactory/generic-basics-demo-local/test.txt
```

## Setting properties through CLI

```bash
jf rt sp %RT_URL%/artifactory/generic-basics-demo-local/test.txt key1=value1
```

## Setting properties through REST API

```bash
curl -X PUT -u %RT_USERNAME%:%RT_TOKEN% %RT_URL%/artifactory/api/storage/generic-basics-demo-local/test.txt?properties=key2=value2
```

## Query via filespec & AQL (CLI)

```bash
jf rt s --spec=query-aql-cli.json
```

## Query via AQL (REST API)

```bash
curl -X POST -u %RT_USERNAME%:%RT_TOKEN% -d "@query-aql-rest.txt" -H "Content-Type: text/plain" %RT_URL%/artifactory/api/search/aql
```

## Query via GraphQL

```bash
curl -H "Authorization: Bearer %RT_TOKEN%" -X POST %RT_URL%/metadata/api/v1/query -d "@query-graphql.json"
```
