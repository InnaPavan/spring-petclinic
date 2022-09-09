#bin/bash

#This script will get latest 10 artifacts from nexus

NEXUS_URL=http://13.42.12.118:8081
MAVEN_REPO=maven-releases 
GROUP_ID=org.springframework.samples
ARTIFACT_ID=spring-petclinic
VERSION=2.6.3
FILE_EXTENSION=jar

download_url=$(curl -L -u admin:Summer@123 -X GET "${NEXUS_URL}/service/rest/v1/search/assets?repository=${MAVEN_REPO}&maven.groupId=${GROUP_ID}&maven.artifactId=${ARTIFACT_ID}&maven.baseVersion=${VERSION}&maven.extension=${FILE_EXTENSION}" -H  "accept: application/json" | jq -rc '.items | .[].downloadUrl') 
echo $download_url

wget --user=admin --password=Summer@123 $download_url
