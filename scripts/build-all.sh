#!/bin/bash
swfile=jboss-eap-6.3.0.Beta.zip
if [ -f "software/$swfile" ]
then
	echo "Building the JBoss EAP 6.3 containers"
	docker build -t eap63 .
	docker build -t eap-dc dc
	docker build -t eap-dc-backup dc-backup
	docker build -t eap-node node
	
else
	echo "File software/$swfile not found."
        echo "Please download JBoss EAP 6.3 Beta from http://jboss.org/products/eap"
        exit 0
fi
