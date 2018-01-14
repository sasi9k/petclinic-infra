echo off
SET mypath=%~dp0
cd %mypath%
.\mvnw -gs settings.xml test
