echo off
SET mypath=%~dp0
cd %mypath%
.\mvnw -U -gs settings.xml  org.apache.maven.plugins:maven-dependency-plugin:2.8:copy ^
                  -Dartifact=%GROUPID%:%ARTIFACTID%:%VERSION%-SNAPSHOT:%PACKAGING% ^
		  -Dtransitive=false -DoutputDirectory=. -Dmdep.stripVersion=true ^
		   && ^
		   .\mvn -gs settings.xml deploy:deploy-file -DgroupId=%GROUPID% ^
                        -DartifactId=%ARTIFACTID% ^
		        -Dversion=%VERSION% ^
		        -Dpackaging=%PACKAGING% ^
		        -Dfile=%ARTIFACTID%.%PACKAGING% ^
		        -DrepositoryId=nexus ^
		        -Durl=%NEXUS_URL%/maven-releases

