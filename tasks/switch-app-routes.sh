#!/bin/bash

cf api $CF_API --skip-ssl-validation

cf login -u $CF_USERNAME -p $CF_PASSWORD -o "$CF_ORGANIZATION" -s "$CF_SPACE"

cf apps

cf routes

export MAIN_ROUTE_HOSTNAME=main-$ARTIFACT_ID

export NEXT_APP_COLOR=$(cat ./current-app-info/next-app.txt)
export NEXT_APP_HOSTNAME=$NEXT_APP_COLOR-$ARTIFACT_ID

export CURRENT_APP_COLOR=$(cat ./current-app-info/current-app.txt)
export CURRENT_APP_HOSTNAME=$CURRENT_APP_COLOR-$ARTIFACT_ID

echo "Mapping main app route to point to $NEXT_APP_HOSTNAME instance"
cf map-route $NEXT_APP_HOSTNAME $CF_APP_DOMAIN --hostname $MAIN_ROUTE_HOSTNAME

cf routes

echo "Removing previous main app route that pointed to $CURRENT_APP_HOSTNAME instance"

cf unmap-route $CURRENT_APP_HOSTNAME $CF_APP_DOMAIN --hostname $MAIN_ROUTE_HOSTNAME

echo "Routes updated"

cf routes
