#######################################################################
#                                                                     #
# Creates a base CentOS image with JBoss Data Virtualization 6.0.0.GA #
#                                                                     #
#######################################################################

# Use the centos base image
FROM centos
MAINTAINER Thomas Qvarnstrom <tqvarnst@redhat.com>


USER root
# Update the system
RUN yum -y update;yum clean all




##########################################################
# Install Java JDK, SSH and other useful cmdline utilities
##########################################################
RUN yum -y install java-1.7.0-openjdk which telnet unzip openssh-server sudo openssh-clients iputils iproute httpd-tools; yum clean all
ENV JAVA_HOME /usr/lib/jvm/jre
RUN chkconfig sshd on
RUN service sshd start

# Create jboss user with password "jboss"
RUN useradd -m -d /home/jboss -p "2yfRR9.I3eJac" jboss

# enabling sudo group for jboss
RUN echo '%jboss ALL=(ALL) ALL' >> /etc/sudoers

# Increase ulimit
RUN echo "* soft nofile 4096" >> /etc/security/limits.conf
RUN echo "* hard nofile 4096" >> /etc/security/limits.conf



############################################
# Install JBoss EAP 6.3.0
############################################
USER jboss
ENV INSTALLDIR /home/jboss/software
ENV JBOSS_HOME /home/jboss/jboss-eap-6.3
ENV HOME /home/jboss
ENV JAVA_OPTS -Xms256m -Xmx512m -XX:MaxPermSize=256m -Djava.net.preferIPv4Stack=true -Djboss.modules.system.pkgs=$JBOSS_MODULES_SYSTEM_PKGS -Djava.awt.headless=true

RUN mkdir -p $INSTALLDIR
ADD software/jboss-eap-6.3.0.Beta.zip $INSTALLDIR/jboss-eap-6.3.0.Beta.zip
RUN unzip -d $HOME $INSTALLDIR/jboss-eap-6.3.0.Beta.zip

# Add a JBoss admin user
RUN $JBOSS_HOME/bin/add-user.sh -g admin -u admin -p admin-123 -s


# Command line shortcuts
RUN echo "export JAVA_HOME=/usr/lib/jvm/jre" >> $HOME/.bash_profile
RUN echo "alias ll='ls -l --color=auto'" >> $HOME/.bash_profile
RUN echo "alias grep='grep --color=auto'" >> $HOME/.bash_profile
RUN echo "alias c='clear'" >> $HOME/.bash_profile



# Clean up
RUN rm -rf $INSTALLDIR/software


# Finished


