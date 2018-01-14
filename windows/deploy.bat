SET mypath=%~dp0
cd %mypath%
.\mvnw -U -gs settings.xml org.apache.maven-plugins:maven-dependency-plugin:2.8.0:copy ^
                  -Dartifact=%GROUPID%:%ARTIFACTID%:%VERSION%-SNAPSHOT:%PACKAGING% ^
		  -Dtransitive=false -DoutputDirectory=. -Dmdep.stripVersion=true

