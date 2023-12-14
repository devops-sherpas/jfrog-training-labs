@echo off
setlocal enabledelayedexpansion

for %%i in (repositories/*.json) do (
  echo Creating repository: %%~ni
  curl -f -u %RT_USERNAME%:%RT_TOKEN% -X PUT -H "Content-Type: application/json" -d "@repositories/%%i" %RT_URL%/artifactory/api/repositories/%%~ni
  echo:
)

for %%i in (repositories/virtual/*.json) do (
  echo Creating virtual repository: %%~ni
  curl -f -u %RT_USERNAME%:%RT_TOKEN% -X PUT -H "Content-Type: application/json" -d "@repositories/virtual/%%i" %RT_URL%/artifactory/api/repositories/%%~ni
  echo:
)

echo Uploading signing key
curl -f -X POST -u %RT_USERNAME%:%RT_TOKEN% -d "@create-keypair.json" -H "Content-Type: application/json" %RT_URL%/artifactory/api/security/keypair
