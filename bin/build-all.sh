#!/bin/bash
SCRIPT_DIR=`dirname $0`

pushd $SCRIPT_DIR/../images
swfile=jboss-eap-6.3.0.zip
if [ -f "eap-base/software/$swfile" ]
then
	echo "Building the JBoss EAP 6.3 containers"
	docker build -t eap-base eap-base
	docker build -t eap-dc dc
	docker build -t eap-dc-backup dc-backup
	docker build -t eap-node node
	
else
	echo "File eap-base/software/$swfile not found."
        echo "Please download JBoss EAP 6.3 Beta from http://jboss.org/products/eap"
        exit 0
fi
popd
