#######################################################################
#                                                                     #
# Creates a base CentOS image with JBoss Data Virtualization 6.0.0.GA #
#                                                                     #
#######################################################################

# Use the centos base image
FROM eap63
MAINTAINER Thomas Qvarnstrom <tqvarnst@redhat.com>

USER jboss

ADD support-files/host.xml $JBOSS_HOME/domain/configuration/host.xml

EXPOSE 8080

#RUN $JBOSS_HOME/bin/add-user.sh -g admin -u admin -p admin-123 -s
CMD $JBOSS_HOME/bin/domain.sh  \
	-Djboss.domain.master.address=${DC_MASTER_PORT_9999_TCP_ADDR} \
	-Djboss.domain.backup.address=${DC_BACKUP_PORT_9999_TCP_ADDR}



