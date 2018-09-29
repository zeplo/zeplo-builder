FROM php:5-zts-alpine3.7

COPY ./setup.sh /setup.sh

RUN sh /setup.sh
RUN mv composer.phar /usr/local/bin/composer

CMD php