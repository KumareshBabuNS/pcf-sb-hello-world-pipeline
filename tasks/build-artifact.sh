#!/bin/bash

VERSION=`cat $VERSION_FILE`
ARTIFACT_NAME="${ARTIFACT_ID}-${VERSION}.${PACKAGING}"

cd $APPLICATION_DIR
./mvnw clean package -Pci -DversionNumber=$VERSION

# Copy artifact to Concourse output folder
cd ..
cp $APPLICATION_DIR/target/$ARTIFACT_NAME $ARTIFACT_DIR/$ARTIFACT_NAME
