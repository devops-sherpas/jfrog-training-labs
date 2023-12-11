@echo off

rem Create repository
jf rt repo-create 01-basics\repo-create.json

rem Upload using CLI
jf rt upload test.txt generic-local-demo/

rem Download using CLI
jf rt download generic-local-demo/test.txt .

rem Upload using API
curl -X PUT -u %RT_USERNAME%:%RT_PASSWORD% -d "@test.txt" %RT_URL%/artifactory/generic-local-demo/test.txt

rem Download using API
curl -u %RT_USERNAME%:%RT_PASSWORD% %RT_URL%/artifactory/generic-local-demo/test.txt

rem Setting properties through CLI
jf rt sp %RT_URL%/artifactory/generic-local-demo/test.txt key1=value1

rem Setting properties through API
curl -X PUT -u %RT_USERNAME%:%RT_PASSWORD% %RT_URL%/artifactory/api/storage/generic-local-demo/test.txt?properties=key2=value2

rem Artifacts query via AQL
jf rt s --spec=query.json

rem Artifacts query via GraphQL
curl -H "Authorization: Bearer %RT_TOKEN%" -X POST %RT_URL%/metadata/api/v1/query -d "@query-graphql.json"
