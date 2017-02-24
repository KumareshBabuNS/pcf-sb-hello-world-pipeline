#!/bin/bash

echo "Installing artillery for load tests: https://artillery.io/docs/getting-started/"

npm install -g artillery

NEXT_APP_COLOR=$(cat ./current-app-info/next-app.txt)
NEXT_APP_URL=http://$NEXT_APP_COLOR-$ARTIFACT_ID.$CF_APP_DOMAIN/

echo "Running artillery load tests against $NEXT_APP_URL..."

artillery quick --duration 10 --rate 10 $NEXT_APP_URL
