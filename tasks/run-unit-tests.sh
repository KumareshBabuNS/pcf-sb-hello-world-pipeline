#!/bin/bash

pwd

ls -al

cd $APPLICATION_DIR

./mvnw clean test
