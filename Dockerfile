FROM centos:8
LABEL maintainer="GabeCastanon"
LABEL contant="havecastanon@gmail.com"
RUN yum -y update && yum clean all
RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-14.noarch.rpm
RUN yum -y install icecast
ADD ./icecast-custom.xml /etc/icecast.xml
RUN sed -ri "s/<bind-address>127.0.0.1<\/bind-address>/<bind-address>0.0.0.0<\/bind-address>/g" /etc/icecast.xml
CMD sed -ri "s/<port>8000<\/port>/<port>$PORT<\/port>/g" /etc/icecast.xml && /bin/icecast -c /etc/icecast.xml