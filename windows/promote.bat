.\mvnw -U org.apache.maven-plugins:maven-dependency-plugin:2.8:copy ^
                  -Dartifact=${GROUPID}:${ARTIFACTID}:${VERSION}-SNAPSHOT:${PACKAGING} ^
		  -Dtransitive=false -DoutputDirectory=. -Dmdep.stripVersion=true

.\mvn deploy:deploy-file -DgroupId=${GROUPID} ^
                        -DartifactId=${ARTIFACTID} ^
		        -Dversion=${VERSION} ^
		        -Dpackaging=${PACKAGING} ^
		        -Dfile=${ARTIFACTID}.${PACKAGING} ^
		        -DrepositoryId=nexus ^
		        -Durl=${NEXUS_URL}/maven-snapshots

