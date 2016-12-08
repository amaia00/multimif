#!/bin/bash
rm -rf repositories/*
mvn -T 32 tomcat7:run
