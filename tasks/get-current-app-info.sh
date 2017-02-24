#!/bin/bash

cf api $CF_API --skip-ssl-validation

cf login -u $CF_USERNAME -p $CF_PASSWORD -o "$CF_ORGANIZATION" -s "$CF_SPACE"

cf apps

cf apps | grep $ARTIFACT_ID | grep green
if [ $? -eq 0 ]
then
  echo "green" > ./current-app-info/current-app.txt
  echo "blue" > ./current-app-info/next-app.txt
else
  echo "blue" > ./current-app-info/current-app.txt
  echo "green" > ./current-app-info/next-app.txt
fi

echo "Current main app routes to app instance $(cat ./current-app-info/current-app.txt)"
echo "New version of app to be deployed to instance $(cat ./current-app-info/next-app.txt)"
