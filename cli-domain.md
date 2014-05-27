### This file describes how to make the backup up domain the primary


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





