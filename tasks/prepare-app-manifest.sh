#!/bin/bash

# copy the artifact to the output directory
VERSION=`cat $VERSION_FILE`
ARTIFACT_NAME="${ARTIFACT_ID}-${VERSION}.${PACKAGING}"

INPUT_ARTIFACT="$ARTIFACT_DIR/$ARTIFACT_NAME"
OUTPUT_ARTIFACT="$OUTPUT_DIR/$ARTIFACT_NAME"

if [ ! -f "$INPUT_ARTIFACT" ]; then
  error_and_exit "can not find artifact: $INPUT_ARTIFACT"
fi

cp $INPUT_ARTIFACT $OUTPUT_ARTIFACT

# copy the manifest to the output directory and process it
INPUT_MANIFEST=$APPLICATION_DIR/manifest.yml
OUTPUT_MANIFEST=$OUTPUT_DIR/manifest.yml

cp $INPUT_MANIFEST $OUTPUT_MANIFEST

echo $ARTIFACT_NAME

cat $OUTPUT_MANIFEST

# the path in the manifest is always relative to the manifest itself
sed -i -- "s|path: .*$|path: $ARTIFACT_NAME|g" $OUTPUT_MANIFEST

cat $OUTPUT_MANIFEST

cat ./current-app-info/current-app.txt
NEW_APP_COLOR=`cat ./current-app-info/next-app.txt`

sed "s/name: $ARTIFACT_ID/name: $NEW_APP_COLOR-$ARTIFACT_ID/" $INPUT_MANIFEST > $OUTPUT_MANIFEST

cat $OUTPUT_MANIFEST
