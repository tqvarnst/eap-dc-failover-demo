docker run -P -d -t --name="dc-master" eap-dc

#docker run -d --name="node-1" --link dc-master:linked-dc-master --link dc-slave:linked-dc-slave jbosseap63beta
#docker run -d --name="node-2" --link dc-master:linked-dc-master --link dc-slave:linked-dc-slave jbosseap63beta

# Wait for the main dc to start
sleep 2
docker run -P -d --name="dc-backup" --link dc-master:dc_master eap-dc-backup 
docker run -d -t --name="node" --link dc-master:dc_master --link dc-backup:dc_backup eap-node
