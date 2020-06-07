FROM devopsedu/webapp

LABEL maintainer="martinbrightin1@gmail.com"

ADD website /var/www/html

RUN rm /var/www/html/index.html

CMD apachectl -D FOREGROUND
