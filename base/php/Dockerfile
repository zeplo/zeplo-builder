FROM php:7.3.1-zts-alpine3.8

COPY ./setup.sh /setup.sh

RUN sh /setup.sh
RUN mv composer.phar /usr/local/bin/composer

CMD php
