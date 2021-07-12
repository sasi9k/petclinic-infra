REM echo off
SET mypath=%~dp0
cd %mypath%
.\mvnw -U -gs settings.xml org.apache.maven.plugins:maven-dependency-plugin:2.8:copy ^
                  -Dartifact=%GROUPID%:%ARTIFACTID%:%VERSION%-SNAPSHOT:%PACKAGING% ^
		  -Dtransitive=false -DoutputDirectory=. -Dmdep.stripVersion=true ^
                  && move /y *.%PACKAGING% %1

IF %ERRORLEVEL% NEQ 0 (
  REM do something here to address the error
  ECHO "**************Error Code**************"
)
SET TARGET_DIR=%1
echo %1
echo "------"
echo %TARGET_DIR%
if exist %TARGET_DIR% echo "Folder already exists"

if not exist %TARGET_DIR% mkdir %TARGET_DIR%
move /y *.%PACKAGING% %1
