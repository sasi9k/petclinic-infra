echo off
SET mypath=%~dp0
cd %mypath%
.\mvnw -gs settings.xml versions:set -DnewVersion=1.5.1-SNAPSHOT
.\mvnw -gs settings.xml deploy
