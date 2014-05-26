#!/bin/bash

containers=`docker ps -a | grep -v CONTAINER | cut -d ' ' -f 1`
for container in $containers
do
	echo -n "Stopping ..."
	docker rm -f $container
done
