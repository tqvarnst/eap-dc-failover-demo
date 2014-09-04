# JBoss EAP 6.3 Domain controller failover demo
This repostiory contains the demonstration for doing failover between different domaincontrollers

## Prerequisites
1. Install [Docker](https://www.docker.io/gettingstarted/#1)
2. Download JBoss EAP 6.3 from [jboss.org.](http://www.jboss.org/products/eap/download/)
2. Put the downloaded file: into images/eap-base/software
        cp ~/Downloads/jboss-eap-6.3.0.zip images/eap/software/
        
_If you are on OS X then see How to use [Docker on OS X.](https://github.com/fabric8io/fabric8-docker/blob/master/DockerOnOSX.md)_
	
## Building the docker container locally
Once you have [installed docker](https://www.docker.io/gettingstarted/#h_installation) and downloaded the JBoss EAP software, you should be able to build the containers via the following command:

        $ bin/build-all.sh

If everything goes well you can now move on to Start the container section

## Start the container
Once you have build the continers you can now start the container. For that we have a helps script that can be execute like this

        $ bin/start-all.sh
        
## Run the demo


### Accessing the adminstration console for master dc
The port for accessing the master domain controllers admin console are allready forwarded, but will be unique. To find out which port is used execute the followding command

        $ docker ps

This should list atleast three running instances where similar to below

        



1. Run the following command from command line to start a docker images with the CLI binaries installed

        $ docker run -i -t --link dc-backup:dc_backup eap-base /bin/bash

2. Run the following command to connect to the backup domain controller

        $JBOSS_HOME/bin/jboss-cli.sh \
            --controller=$DC_BACKUP_PORT_9999_TCP_ADDR:9999 \
	        --user=admin \
	        --password=admin-123 \
	        --connect
	    
3. Then run the following commands

        > /host=backup:write-local-domain-controller
        > reload --host=backup

4. Or Instead of step 2 and 3 run the following command
	    
        $JBOSS_HOME/bin/jboss-cli.sh \
            --controller=$DC_BACKUP_PORT_9999_TCP_ADDR:9999 \
	        --user=admin \
	        --password=admin-123 \
	        --connect \
	        --commands="/host=backup:write-local-domain-controller,reload --host=backup"





