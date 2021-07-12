#!/bin/bash
export JAVA_HOME=/usr/lib/jvm/default-java
cd "$(dirname "$0")"
./mvnw -U -gs settings.xml  org.apache.maven.plugins:maven-dependency-plugin:2.8:copy \
                  -Dartifact=$GROUPID:$ARTIFACTID:$VERSION-SNAPSHOT:$PACKAGING \
		  -Dtransitive=false -DoutputDirectory=. -Dmdep.stripVersion=true \
		   && ^ ./mvnw -gs settings.xml deploy:deploy-file -DgroupId=$GROUPID \
                        -DartifactId=$ARTIFACTID \
		        -Dversion=$VERSION \
		        -Dpackaging=$PACKAGING \
		        -Dfile=$ARTIFACTID.$PACKAGING \
		        -DrepositoryId=nexus \
		        -Durl=$NEXUS_URL/maven-releases

