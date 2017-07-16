FROM lamp:v1
MAINTAINER pcat
ENV REFRESHED_AT 2017-07-15

RUN rm -f /var/www/html/index.html
ADD pcat_fish.tar.gz /var/www

COPY start.sh /root/start.sh
ENTRYPOINT chmod +x /root/start.sh ;./root/start.sh
EXPOSE 80