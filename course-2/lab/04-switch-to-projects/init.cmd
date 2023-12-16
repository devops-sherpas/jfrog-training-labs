@echo off
setlocal enabledelayedexpansion

for %%i in (repositories/*.json) do (
  echo Creating repository: %%~ni
  jf rt rc repositories/%%i
)

for %%i in (repositories/virtual/*.json) do (
  echo Creating virtual repository: %%~ni
  jf rt rc repositories/virtual/%%i
)

echo Creating groups...
jf rt gc team1
jf rt gc team2

echo Creating users...
jf rt user-create team1u1 Team1u1! labs-team1u1@jfrog.com --users-groups team1
jf rt user-create team1u2 Team1u2! labs-team1u2@jfrog.com --users-groups team1
jf rt user-create team2u1 Team2u1! labs-team2u1@jfrog.com --users-groups team2

for %%i in (permissions/*.json) do (
  echo Creating permission target: %%~ni
  jf rt ptc permissions/%%i
  echo:
)
