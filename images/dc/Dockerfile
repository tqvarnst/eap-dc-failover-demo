#######################################################################
#                                                                     #
# Creates a base JBoss EAP 63 Domain controller image  				  #
#                                                                     #
#######################################################################

# Use the centos base image
FROM eap-base
MAINTAINER Thomas Qvarnstrom <tqvarnst@redhat.com>

USER jboss

ADD support-files/domain.xml $JBOSS_HOME/domain/configuration/domain.xml
ADD support-files/host.xml $JBOSS_HOME/domain/configuration/host.xml

EXPOSE 22 9990 9999

CMD $JBOSS_HOME/bin/domain.sh -bmanagement=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')

# Finished

