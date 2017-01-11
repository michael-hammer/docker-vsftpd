# debian-based container for vsftpd
# VERSION               0.3
FROM debian:jessie
MAINTAINER Michael Hammer <mail@michael-hammer.at>

RUN apt-get update && apt-get install -y --no-install-recommends vsftpd nano logrotate
RUN apt-get clean

RUN sed -i "s/anonymous_enable=NO/anonymous_enable=YES/" /etc/vsftpd.conf
RUN sed -i "s/local_enable=YES/local_enable=NO/" /etc/vsftpd.conf
RUN mkdir -p /var/run/vsftpd/empty

VOLUME /srv/ftp

EXPOSE 21

CMD ["/usr/sbin/vsftpd","/etc/vsftpd.conf"]

