# Demo: Search Capabilities

## Search using AQL

```bash
curl -X POST -u %RT_USERNAME%:%RT_TOKEN% -d "@query-aql-rest.txt" -H "Content-Type: text/plain" %RT_URL%/artifactory/api/search/aql
```

## Search using GraphQL

```bash
curl -H "Authorization: Bearer %RT_TOKEN%" -X POST %RT_URL%/metadata/api/v1/query -d "@query-graphql.json"
```

## Search with filespec through CLI

TODO: Find out how to search for files and filter by properties using GraphQL.

```bash
jf rt s --spec=query-aql-cli.json
```
