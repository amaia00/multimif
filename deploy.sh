#!/bin/bash
rm -rf repositories/*
hg pull --insecure
hg update
mvn -T 32 clean install -DskipTests
mvn -T 32 tomcat7:run
