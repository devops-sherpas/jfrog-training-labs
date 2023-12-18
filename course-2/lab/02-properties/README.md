# Lab: Properties

In this lab, we will practice setting properties on artifacts and searching for artifacts based on
these properties.

## Progress

### Applying property through the UI

1. Create a repository called `generic-lab-local`. Choose the `Generic` package type.
2. Create a local file called `test.txt` with any contents, and upload it to the `generic-lab-local` repository.
3. Apply the property `maturity` with the value `dev`:
   1. In the artifacts browser view, navigate to the file you just uploaded.
   2. Navigate to the `Properties` tab.
   3. Add a property by the name `maturity` with the value `dev`.

### Searching for artifacts by property value using AQL through the CLI

1. Prepare a JSON file containing a CLI file spec (call it, as an example, `query-aql-cli.json`):
   ```json
   {
     "files": [
       {
         "aql": {
           "items.find": {
             "repo": "generic-lab-local",
             "@maturity": "dev"
           }
         }
       }
     ]
   }
   ```

2. Execute the search:
   ```bash
   jf rt s --spec=query-aql-cli.json
   ```

### Applying property through the CLI

1. Apply the property `maturity` with the value `qa:
   ```bash
   jf rt sp generic-lab-local/test.txt maturity=qa
   ```

   (Note: to set properties on multiple files at once, you can construct a file spec containing an AQL query, and pass it
   using the `--spec` parameter to this command. All artifacts that match the query will have your property set)

### Searching for artifacts by property value using AQL through the REST API

1. Create a text file (for example: `query-aql-rest.txt`) containing the AQL query to run:
   ```
   items.find(
     {
       "repo": {"$eq": "generic-lab-local"},
       "@maturity": {"$eq": "qa"}
     }
   )
   ```

2. Execute the search:
   ```bash
   curl -X POST -u $RT_USERNAME:$RT_TOKEN -d "@query-aql-rest.txt" -H "Content-Type: text/plain" $RT_URL/artifactory/api/search/aql
   ```

### Applying property through the REST API

1. Use the following command to set the `maturity` property to `prod`:
   ```bash
   curl -X PUT -u $RT_USERNAME:$RT_TOKEN $RT_URL/artifactory/api/storage/generic-lab-local/test.txt?properties=maturity=prod
   ```

### Searching for artifacts by property value using GraphQL

*TODO*
