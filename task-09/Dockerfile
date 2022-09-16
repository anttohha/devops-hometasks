FROM debian:latest

RUN apt-get update -y
RUN apt-get install -y apache2
RUN apt-get install -y php
COPY index.php /var/www/html/
RUN rm /var/www/html/index.html

EXPOSE 80

CMD apachectl -D FOREGROUND
