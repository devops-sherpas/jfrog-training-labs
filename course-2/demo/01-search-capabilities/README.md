# Demo: Search Capabilities

## Preparation

Change the `test.txt` artifact inside `generic-demo-local` so it has a property called `maturity` with the value `prod`.

## Search using AQL

```bash
curl -X POST -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -d "@query-aql-rest.txt" -H "Content-Type: text/plain" $JFROG_URL/artifactory/api/search/aql
```

## Search using GraphQL

```bash
curl -H "Authorization: Bearer $JFROG_ACCESS_TOKEN" -X POST $JFROG_URL/metadata/api/v1/query -d "@query-graphql.json"
```

## Search with filespec through CLI

TODO: Find out how to search for files and filter by properties using GraphQL.

```bash
jf rt s --spec=query-aql-cli.json
```
